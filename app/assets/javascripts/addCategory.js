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