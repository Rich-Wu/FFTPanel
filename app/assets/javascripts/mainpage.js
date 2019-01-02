var intro = document.getElementsByClassName("logo");
setTimeout(function() {
  intro[0].classList.add("showlogo");}, 500);
var navitems = document.getElementsByClassName('navitem');
var menu = document.getElementsByClassName('menu')[0];
window.addEventListener('click', function(){
  document.getElementsByClassName('logo')[0].style.transition = '0s';
  menu.className = menu.className + " show";
});
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
