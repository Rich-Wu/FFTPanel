var navitems = document.getElementsByClassName('navitem');
var menu = document.getElementsByClassName('menu')[0];
setTimeout(function() {
  menu.className = menu.className + " show";
}, 2600);
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
    this.parentElement.style.remove('menuitem');
  }
};
