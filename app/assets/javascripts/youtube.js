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


function youtubeParser(url){
  var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
  var match = url.match(regExp);
  return (match&&match[7].trim().length==11)? match[7] : false;
};

  var link = $('.this-thing').html();
  var parsedUrl = youtubeParser(link).trim();


// 2. This code loads the IFrame Player API code asynchronously.
   var tag = document.createElement('script');
   tag.src = "https://www.youtube.com/iframe_api";
   var firstScriptTag = document.getElementsByTagName('script')[0];
   firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

   // 3. This function creates an <iframe> (and YouTube player)
   //    after the API code downloads.
   var player;
   function onYouTubeIframeAPIReady() {
     player = new YT.Player('player', {
       height: '390',
       width: '640',
       videoId: parsedUrl,
       events: {
         'onReady': onPlayerReady,
         'onStateChange': onPlayerStateChange
       }
     });
   }

   // 4. The API will call this function when the video player is ready.
   function onPlayerReady(event) {
     event.target.playVideo();
   }

   // 5. The API calls this function when the player's state changes.
   //    The function indicates that when playing a video (state=1),
   //    the player should play for six seconds and then stop.
   var done = false;
   function onPlayerStateChange(event) {
     if (event.data == YT.PlayerState.PLAYING && !done) {
       done = true;
     }
   }
   function stopVideo() {
     player.stopVideo();
   }


   $('#get-time').on('click', function(){
       var currentTime = player.getCurrentTime();
       $('#time-input').val(prettySeconds(currentTime));
   });
