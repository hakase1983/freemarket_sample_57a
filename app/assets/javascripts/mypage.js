$(function() {
  $('.mypage-user-tab1').on('click', function () {
    $('.mypage-user-tab2').css('border-top','none');
    $('.mypage-user-tab2').css('background-color','#eee');
    $('.mypage-user-tab1').css('background-color','#fff');
    $('.mypage-user-tab1').css('border-top','#ea352d 2px solid ');
    $('.todo').addClass('display2');
    $('.display1').css('display','block');
  })

  $('.mypage-user-tab2').on('click', function () {
    $('.mypage-user-tab1').css('border-top','none');
    $('.mypage-user-tab1').css('background-color','#eee');
    $('.mypage-user-tab2').css('background-color','#fff');
    $('.mypage-user-tab2').css('border-top','#ea352d 2px solid ');
    $('.display1').css('display','none');
    $('.todo').removeClass('display2');
  })

  $('.mypage-continue-tab1').on('click', function () {
    $('.mypage-end-tab2').css('border-top','none');
    $('.mypage-end-tab2').css('background-color','#eee');
    $('.mypage-continue-tab1').css('background-color','#fff');
    $('.mypage-continue-tab1').css('border-top','#ea352d 2px solid ');
    $('.past-transaction').addClass('bought-display2');
    $('.bought-display1').css('display','block');
  })

  $('.mypage-end-tab2').on('click', function () {
    $('.mypage-continue-tab1').css('border-top','none');
    $('.mypage-continue-tab1').css('background-color','#eee');
    $('.mypage-end-tab2').css('background-color','#fff');
    $('.mypage-end-tab2').css('border-top','#ea352d 2px solid ');
    $('.bought-display1').css('display','none');
    $('.past-transaction').removeClass('bought-display2');
  })

});