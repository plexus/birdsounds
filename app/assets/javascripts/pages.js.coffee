# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

soundManager.url = '/soundmanager/swf/'
soundManager.useHTML5Audio = true
soundManager.preferFlash = true
soundManager.useFlashBlock = false
soundManager.useHighPerformance = true
soundManager.useFastPolling = true

config =
  id: 'mySound'
  url: '/test.mp3'
  autoLoad: true
  autoPlay: true

soundManager.onready( ->
  soundManager.createSound(config).play()
)
