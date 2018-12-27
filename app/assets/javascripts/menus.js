var navitems = document.getElementsByClassName('navitem');
for (item in navitems) {
  navitems[item].onmouseover = function() {
    this.style.paddingLeft = "10px";
    new Audio("/assets/menumove.mp3").play();
  };
  navitems[item].onmouseout = function() {
    this.style.paddingLeft = "0";
  };
  navitems[item].onclick = function() {
    new Audio("/assets/confirm.mp3").play();
  }
};
