const timeCount = () => {
  let timeDisplay = document.getElementById("time-display");
  let timeList = document.getElementById("time-list");
  let startButton = document.getElementById("start-button");
  let sound = document.getElementById("sound");
  let goodText = document.getElementById("good-text");
  let blackText = document.getElementById("black-text");
  let memoButton = document.getElementById("memo-button");
  

  startButton.addEventListener("click", (e) => {
    e.preventDefault();          
    let alarmTime = 10;
    let intervalId = setInterval(function () {
      alarmTime--;
      let minutes = Math.floor(alarmTime / 60).toString().padStart(2, "0");
      let seconds = (alarmTime % 60).toString().padStart(2, "0");
      timeDisplay.innerHTML = `${minutes}:${seconds}`
      if ( alarmTime == 0 ) {
        let speech = window.speechSynthesis
        let endMsg = new SpeechSynthesisUtterance;
        endMsg.volume = 1;
        endMsg.rate = 1;
        endMsg.pitch = 1;
        endMsg.text = "Hello Hello Hello";
        endMsg.lang = "en-US";
        speech.speak(endMsg);
       
        clearInterval(intervalId);
        if ( goodText.value.length >= 1 || blackText.value.length >= 1 ) {
          memoButton.click();
        };
        window.setTimeout(function () {
          window.location.href=""
        }, 5000);
      };
    }, 1000);
  });
};

window.addEventListener("DOMContentLoaded", timeCount)