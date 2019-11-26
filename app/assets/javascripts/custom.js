// flashメッセージ
$(function(){
  setTimeout("$('.flash').fadeOut('slow')", 3000)
})

// 入力文字列からカテゴリー絞り込み
$(function(){
  $('.newThread__form--categoryIndex').children().hide();
  $('input[name="category"]:checked').parent().show();
  $('input[name="category_search"]').keyup(function() {
    $('.newThread__form--categoryIndex').children().hide();
    $('input[name="category"]:checked').parent().show();
    var input_categoryName = $('input[name="category_search"]').val();
    $('.newThread__form--categoryIndex').find("[id*='" + input_categoryName + "']").show();
  })
})

// チェックしたカテゴリーのidをスレッド作成フォームへ埋め込み
$(function(){
  var select_categories = [];
  $('input[name="category"]').change(function(){
    $('input[name="select_categories"]').remove();
    select_categories.length = 0;
    $('input[name="category"]:checked').each(function(){
      select_categories.push($(this).val());
    })
    $('<input>').attr({
      'type': 'hidden',
      'name': 'select_categories',
      'value': select_categories
    }).appendTo($('.newThread__form').children('form'));
  })
})