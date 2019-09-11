$(function(){
  $(document).on('mouseover', '.ichi__top__two__right__mypage', function(){
    $('.ichi__top__two__right__mypage__profile').fadeIn(0001);
  })
  $(document).on('mouseover','.ichi__main', function(){
    $('.ichi__top__two__right__mypage__profile').fadeOut(0001);
  });
  $(document).on('mouseover','.ichi__top__own', function(){
    $('.ichi__top__two__right__mypage__profile').fadeOut(0001);
  });
})