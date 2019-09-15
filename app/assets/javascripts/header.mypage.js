$(function(){
  $(document).on('mouseover', '.ichi__top__two__right__mypage', function(){
    $('.ichi__top__two__right__mypage__profile').show();
  })
  $(document).on('mouseover','.ichi__main', function(){
    $('.ichi__top__two__right__mypage__profile').hide();
  });
  $(document).on('mouseover','.ichi__exhibit', function(){
    $('.ichi__top__two__right__mypage__profile').hide();
  });
  $(document).on('mouseover','.pankuzu', function(){
    $('.ichi__top__two__right__mypage__profile').hide();
  });
  $(document).on('mouseover','.kawa-wrapper', function(){
    $('.ichi__top__two__right__mypage__profile').hide();
  });
})