var navitems = document.getElementsByClassName('navitem');
for (item in navitems) {
  navitems[item].onmouseover = function() {
    this.style.paddingLeft = "10px";
    new Audio("sounds/menumove.mp3").play();
  };
  navitems[item].onmouseout = function() {
    this.style.paddingLeft = "0";
  };
  navitems[item].onclick = function() {
    new Audio("sounds/confirm.mp3").play();
  }
};

var intro = document.getElementsByClassName("logo");
setTimeout(function() {
  intro[0].classList.add("showlogo");}, 500);
