// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
$(function() {
  $('#submit').attr('disabled', 'disabled');

  $('#check').click(function() {
    if ( $(this).prop('checked') == false ) {
      $('#submit').attr('disabled', 'disabled');
    } else {
      $('#submit').removeAttr('disabled');
    }
  });
});


var setImage = [
  "cake-2.jpg",
  "cake-3.jpg",
  "cake-4.jpg",
  "cake.jpg"];

//カウンターの初期値設定
var counter = 0;

//設定した画像パスをid="slideshow"のbackground-imageに設定する、繰り返す
function slideimage(){
    //カウンターが設定画像数より大きいか確認
    if( counter >= (setImage.length)){
        //カウンターを初期値に戻す
        counter = 0;
    }
    //背景画像を設定
    document.getElementById( "slideimage" ).style.backgroundImage = "url(" + setImage[counter] + ")";
    //カウントアップ
    counter++;
}

//3秒ごとに背景画像を切り替える
setInterval("slideimage()",3000);


$(function(){
 history.pushState(null, null, null); //ブラウザバック無効化
 //ブラウザバックボタン押下時
 $(window).on("popstate", function (event) {
   history.pushState(null, null, null);
   window.alert('前のページへは戻れません。');
 });
});