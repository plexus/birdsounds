
var Views = {}
var Collections = {}

$(function(){
    Collections.Birdsounds = Backbone.Collection.extend({
        url: '/birdsounds/random/16'
    })
    var birdsoundCollection = new Collections.Birdsounds
    window.bsc = birdsoundCollection

    Views.Birdsound = Backbone.View.extend({
        render: function() {
            this.$el.html(ich.birdsound(this.model.toJSON()))
            return this
        }
    })

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
            view.render()
            //$('#one_page').append(view.render().el)
        },
        addAll: function() {
            birdsoundCollection.each(this.addOne)
        }
    })

  var App = new Views.App
})