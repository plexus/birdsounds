soundManager.url = '/soundmanager/swf/';
soundManager.useHTML5Audio = true;
soundManager.preferFlash = true;
soundManager.useFlashBlock = false;
soundManager.useHighPerformance = true;
soundManager.useFastPolling = true // increased JS callback frequency, combined with useHighPerformance = true

//threeSixtyPlayer.config.scaleFont = (navigator.userAgent.match(/msie/i)?false:true);
//threeSixtyPlayer.config.showHMSTime = true;

// enable some spectrum stuffs

//threeSixtyPlayer.config.useWaveformData = true
//threeSixtyPlayer.config.useEQData = true

// enable this in SM2 as well, as needed

/*
if (threeSixtyPlayer.config.useWaveformData) {
  soundManager.flash9Options.useWaveformData = true
}
if (threeSixtyPlayer.config.useEQData) {
  soundManager.flash9Options.useEQData = true
}
if (threeSixtyPlayer.config.usePeakData) {
  soundManager.flash9Options.usePeakData = true
}
*/

//if (threeSixtyPlayer.config.useWaveformData || threeSixtyPlayer.flash9Options.useEQData || threeSixtyPlayer.flash9Options.usePeakData) {
  // even if HTML5 supports MP3, prefer flash so the visualization features can be used.
  soundManager.preferFlash = true;
//}

// favicon is expensive CPU-wise, but can be enabled.
//threeSixtyPlayer.config.useFavIcon = false;
