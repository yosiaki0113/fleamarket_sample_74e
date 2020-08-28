$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function categoryOption(category){
    var optionHtml = `<option value = "${category.id}">${category.name}</option>`;
    return optionHtml;
  }

  // 親カテゴリー選択後のイベント
  $('#category-select-parent').on('change', function(){
    let parentCategoryId = $(this).val();
    if (parentCategoryId == ''){
      $('#select-children-box').remove();
      $('#select-grandchildren-box').remove();
    }else{
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { parent_id: parentCategoryId },
        dataType: 'json'
      })
      .done(function(category_children){
        $('#select-children-box').remove();
        $('#select-grandchildren-box').remove();
        let optionHtml = '';
        category_children.forEach(function(child){
          optionHtml += categoryOption(child);
        });
        var childSelectHtml = '';
        childSelectHtml = `<div class="sell-collection_select-c__label" id= 'select-children-box'>
                             <select class="sell-collection_select-c__input" id="category-select-children" required="required" name="item[category_id]">
                             <option value="">選択して下さい</option>
                             ${optionHtml}
                             </select>
                             <i class="fas fa-chevron-down"></i>
                           </div>`;
        $('.sell-collection_select-c').append(childSelectHtml);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }
  });

  // 子カテゴリー選択後のイベント
  $('.sell-container__content__details').on('change', '#category-select-children', function(){
    let childrenCategoryId = $(this).val();
    if (childrenCategoryId == ''){
      $('#select-grandchildren-box').remove();
    }else{
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { child_id: childrenCategoryId },
        dataType: 'json'
      })
      .done(function(category_grandchildren){
        $('#select-grandchildren-box').remove();
        let optionHtml = '';
        category_grandchildren.forEach(function(grandchildren){
          optionHtml += categoryOption(grandchildren);
        });
        var grandchildSelectHtml = '';
        grandchildSelectHtml = `<div class="sell-collection_select-c__label" id= 'select-grandchildren-box'>
                             <select class="sell-collection_select-c__input" id="category-select-grandchildren" required="required" name="item[category_id]">
                             <option value="">選択して下さい</option>
                             ${optionHtml}
                             </select>
                             <i class="fas fa-chevron-down"></i>
                           </div>`;
        $('.sell-collection_select-c').append(grandchildSelectHtml);

      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }
  });
  
}); 

$(function(){
  $('#parent_p_1').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_1").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_200').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_200").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_346').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_346").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_481').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_481").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_625').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_625").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_685').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_685").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_798').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_798").offset().top -12 ;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});


$(function(){
  $('#parent_p_898').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_898").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});


$(function(){
  $('#parent_p_984').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_984").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});


$(function(){
  $('#parent_p_1093').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_1093").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});


$(function(){
  $('#parent_p_1147').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_1147").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_1207').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_1207").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

$(function(){
  $('#parent_p_1270').click(function(){
    //スクロールのスピード
    var speed = 500;
    //リンク先までの距離を取得
    var position = $("#parent_1270").offset().top -12;
    //スムーススクロール
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});