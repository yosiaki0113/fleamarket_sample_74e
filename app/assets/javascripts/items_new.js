$(function(){
  $('#image-input').on('change',  function(e){
    let files = e.target.files;
    $.each(files, function(index, file) {
    let reader = new FileReader();

    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    lastIndex = $('.preview-image:last').data('index');
    fileIndex.splice(0, lastIndex);
    $('.hidden-destroy').hide();
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      reader.onload = (function(file){
        return function(e){
          let imageLength = $('#output-box').children('li').length;
          let labelLength = $("#image-input>label").eq(-1).data('label-id');
  // プレビュー表示
          $('#image-input').before(`<li class="preview-image" id = upload-image${labelLength} data-image-id= ${labelLength}>
                                      <figure class="preview-image__figure">
                                        <img src='${e.target.result}' title='${file.name}' >
                                      </figure>
                                      <div class="preview-image__button">
                                        <a class="preview-image__button__delete" data-image-id= ${labelLength} >削除</a>
                                      </div>
                                    </li>`);
          $("#image-input>label").eq(-1).css('display','none');
          
       if (imageLength < 9) {
            $("#image-input").append(`<label for="item_images${labelLength+1}" class="sell-container__content__upload__items__box__label" data-label-id="${labelLength+1}">
                                        <input multiple="multiple" class="sell-container__content__upload__items__box__input" id="item_images${labelLength+1}"  type="file" name="item[images_attributes][${imageLength+1}][url]">
                                        <i class="fas fa-camera fa-lg"></i>
                                      </label>`);         
          };
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });
  $('#image-input').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $("#item_images_attributes_0__destroy");
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image_input').append(buildFileField(fileIndex[0]));
    //０枚の状態にしない
  });
  //プレビューの削除ボタンが押された場合
  $(document).on('click', '.preview-image__button__delete', function(){
    console.log("aaa")
    let targetImageId = $(this).data('image-id');
    $(`#upload-image${targetImageId}`).remove();
    $(`input[name="item[images_attributes][${targetImageId}][url]"]`).remove();
    // $(`label[data-label-id='${targetImageId}']`).remove();
    const hiddenCheck = $(`#item_images_attributes_${targetImageId}__destroy`);
    if (hiddenCheck) {
      hiddenCheck.prop('checked', true);
    }

  });
  // let imageLength = $('#output-box').children('li').length;
});
