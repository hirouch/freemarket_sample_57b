$(function(){
  $(document).on('mouseover','.ichi__top__two__left__category', function(){
    $('.ichi__categories__parent').fadeIn(0001);
  });

  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/category/${child.id}">${child.name}</a>`;
    return html;
  }
  $(document).on("mouseover", ".ichi__category", function() {
    var id = this.id
    $(".ichi__red__category").removeClass("ichi__red__category")
    $('#' + id).addClass("ichi__red__category");
    $(".child_category").remove();
    $(".grand_child_category").remove();
    $.ajax({
      type: 'GET',
      url: '/categories/',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html = buildChildHTML(child);
        $(".ichi__caetgories__children").append(html);
      })
    });
  });


  function buildGrandChildHTML(child){
    var html =`<a class="grand_child_category" id="${child.id}"
              href="/category/${child.id}">${child.name}</a>`;
    return html;
  }
  $(document).on("mouseover", ".child_category", function () {
    var id = this.id
    $(".ichi_gray_category").removeClass("ichi_gray_category");//灰色のcssのため
    $('#' + id).addClass("ichi_gray_category");//灰色のcssのため
    $.ajax({
      type: 'GET',
      url: '/categories/',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".ichi__caetgories__grandchildren").append(html);
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });
    });
  });

  $(document).on('mouseover','.ichi__main', function(){
    $('.ichi__categories__parent').fadeOut(0001);
    $('.child_category').remove();
    $('.grand_child_category').remove();
  });
  $(document).on('mouseover','.ichi__top__own', function(){
    $('.ichi__categories__parent').fadeOut(0001);
    $('.child_category').remove();
    $('.grand_child_category').remove();
  });
});
