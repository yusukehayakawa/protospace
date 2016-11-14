$(function(){
  $('.cover-image-upload').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0];
     reader = new FileReader();
    reader.onload = (function(file) {
      return function(e) {
        $("#main_preview").attr("src", e.target.result);
        $("#main_preview").show();
      };
    })(file);

    reader.readAsDataURL(file);
  });
});

$(function(){
    var image = $('.image-upload'),
    previewImage = $('.preview-image');

    image.each(function(){
        var selfFile = $(this),
        selfInput = $(this).find('input[type=file]'),
        prevElm = selfFile.find(previewImage),
        orgPass = prevElm.attr('src');

        selfInput.change(function(){
            var file = $(this).prop('files')[0],
            fileRdr = new FileReader();

            if (!this.files.length){
                prevElm.attr('src', orgPass);
                return;
            } else {
                if (!file.type.match('image.*')){
                    prevElm.attr('src', orgPass);
                    return;
                } else {
                    fileRdr.onload = function() {
                        prevElm.attr('src', fileRdr.result);
                        $(previewImage).show();
                    }
                    fileRdr.readAsDataURL(file);
                }
            }
        });
    });
});
