var navitems = document.getElementsByClassName('navitem');
var menus = document.getElementsByClassName('menu');
var links = document.getElementsByTagName('a');
setTimeout(function(){
  for (i=0;i<menus.length;i++){
    menus[i].classList.add('show');
  };
}, 10);
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
for (item in links) {
  links[item].onmouseover = function() {
    // this.style.paddingLeft = "2px";
    new Audio("/assets/menumove.mp3").play();
  };
  links[item].onmouseout = function() {
    this.style.paddingLeft = "0";
  };
  links[item].onclick = function() {
    new Audio("/assets/confirm.mp3").play();
  }
};
