var Models = {}
var Views = {}
var Collections = {}

$(function(){
    Models.Birdsound = Backbone.Model.extend(
        {
            defaults: {
                playing: false
            },
            initialize: function() {
                self = this
                soundManager.createSound({
                    id: 's'+this.get('id'),
                    url: this.get('mp3'),
                    //volume: 50,
                    //autoPlay: true,
                    autoLoad: true,
                    volume: 0,

                    onfinish: function() {
                        self.play(false)
                    },

                    onvolume: function() {
                        self.trigger('volume:change')
                    }
                    //whileloading: soundIsLoadingFunction
                })
            },
            sound: function() {
                return soundManager.getSoundById('s'+this.get('id'))
            },
            play: function(first) {
                this.set('playing', true)
                this.sound().play()
                if (first == undefined)
                    this.fadeTo(60)
            },

            fadeTo: function (target) {
                var sound = this.sound()
                var vol = sound.volume
                delta = 5
                if (vol < target) {
                    newVol = Math.min(target, vol + delta)
                } else if (vol > target) {
                    newVol = Math.max(target, vol - delta)
                } else {
                    return false
                }
                sound.setVolume(newVol)
                console.log('--> '+newVol)
                this.trigger('volume:changed')
                self = this
                setTimeout(function(){ self.fadeTo(target) }, 20)
            }
        }
    )

    Collections.Birdsounds = Backbone.Collection.extend({
        model: Models.Birdsound,
        url: '/birdsounds/random/16'
    })

    Views.Birdsound = Backbone.View.extend({
        events: {
            "click" : "togglePlay",
            "volume:changed" : "onVolume"
        },
        render: function() {
            this.$el.html(ich.birdsound(this.model.toJSON()))
            sound_id = 's' + this.model.id
            volume = this.model.sound().volume
            this.slider = $(this.$el.find('.slider')[0])
            this.slider.slider({
                orientation: "vertical",
                range: "min",
                min: 0,
                max: 100,
                value: volume,
                slide: function( event, ui ) {
                    soundManager.setVolume(sound_id, ui.value)
                }
            })
            return this
        },
        togglePlay: function() {
            this.model.play()
            this.render()
        },
        onVolume: function() {
            this.slider.slider('value', this.model.sound().volume)
        }
    })

    var birdsoundCollection = new Collections.Birdsounds

    Views.App = Backbone.View.extend({
        el: $('#one_page'),
        initialize: function() {
            birdsoundCollection.on('add', this.addOne, this)
            birdsoundCollection.on('reset', this.addAll, this)
            birdsoundCollection.on('all', this.render, this)
            birdsoundCollection.fetch()
        },
        addOne: function(model) {
            //alert(model.get('english'))
            var num = birdsoundCollection.indexOf(model)
            var view = new Views.Birdsound({model: model, el: $('#birdsound-'+num)})
            model.on('volume:changed', view.onVolume, view)
            view.render()
            //$('#one_page').append(view.render().el)
        },
        addAll: function() {
            birdsoundCollection.each(this.addOne)
        }
    })
})

soundManager.onready(function () {
    var App = new Views.App
})

