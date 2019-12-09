/*$(function () {
    $(".myNav").on("click", "li", function () {
        $(".myNav > li").removeClass("active");
        $(this).addClass("active");
    })
});*/


var tabBox = document.getElementById("tabBox");
var tabList = tabBox.querySelectorAll(".tab");
var navBox = document.getElementById('navBox');
var navList = navBox.querySelectorAll('li');
	for (var i = 0; i < navList.length; i++) {
        navList[i].myIndex = i;
        navList[i].onclick = function () {
            console.log(this.myIndex);
            changeTab(this.myIndex);
        }
}
function changeTab(clickIndex) {
    for (var j = 0; j < navList.length; j++) {
        navList[j].className = '';
        tabList[j].className = 'tab';
    }
    navList[clickIndex].className = 'active';
    tabList[clickIndex].className = 'tab active';
}
/*$(function () {
    $('#navBox li').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
        $('#tabBox>div:eq(' + $(this).index() + ')').addClass('tab active').siblings().removeClass(
            'tab active');
    })
})*/

