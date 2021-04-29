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
    let alarmTime = 5;
    let intervalId = setInterval(function () {
      alarmTime--;
      let minutes = Math.floor(alarmTime / 60).toString().padStart(2, "0");
      let seconds = (alarmTime % 60).toString().padStart(2, "0");
      timeDisplay.innerHTML = `${minutes}:${seconds}`
      if ( alarmTime == 0 ) {
       
        clearInterval(intervalId);
        if ( goodText.value.length >= 1 || blackText.value.length >= 1 ) {
          memoButton.click();
        };
        window.setTimeout(function () {
          window.location.href="http://localhost:3000/alarms/end"
        }, 5000);
      };
    }, 1000);
  });
};

window.addEventListener("DOMContentLoaded", timeCount)