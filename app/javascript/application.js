// application.js

document.addEventListener("DOMContentLoaded", function() {
    const flashMessages = document.querySelectorAll(".alert");
  
    flashMessages.forEach((flash) => {
      setTimeout(() => {
        flash.classList.add("fade");
        flash.classList.add("show");
        flash.style.transition = "opacity 0.5s ease-out";
        flash.style.opacity = "0";
        setTimeout(() => flash.remove(), 500);
      }, 3000);
    });
  });
  