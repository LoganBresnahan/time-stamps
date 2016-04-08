function prettySeconds(longSeconds){
  var decimalCut = Math.floor(longSeconds);
  var minutes = Math.floor(decimalCut/60);
  var seconds = decimalCut - (minutes * 60);
  if(seconds < 10){
    seconds = "0" + seconds;
  };
  return minutes + ":" + seconds;
}

function uglySeconds(formatedTime){
  var myMinutes = /\#([0-9]*)/;
  minutes = myMinutes.exec(formatedTime)[1];

  var minutesToSeconds = parseInt(minutes) * 60;

  var mySeconds = /\:([0-9]*)/;
  seconds = mySeconds.exec(formatedTime)[1];
  return minutesToSeconds + parseInt(seconds);
}
