window.onload = function(){
slides = new XMLHttpRequest;
slides.open("post", "http://localhost:4567/slides");
slides.send();
slides.addEventListener("load", function(event){
all_slides = JSON.parse(this.response); 
showSlide()   
})
backButton = document.getElementById("previous");
nextButton = document.getElementById("next");
counter = 0
backButton.addEventListener("click", backSlide);
nextButton.addEventListener("click", nextSlide);
title = document.getElementById("title");
body  = document.getElementById("body");
}

function nextSlide() {
  if (counter === 4) {
    counter = 0;
  }
  else {
    counter ++;
  }
  showSlide();
}

function backSlide() {
  if (counter === 0) {
    counter = 4;
  }
  else {
    counter --;
  }
  showSlide();
}

function showSlide() {
  title.innerHTML = all_slides[counter].title; 
  body.innerHTML  = all_slides[counter].body;
}