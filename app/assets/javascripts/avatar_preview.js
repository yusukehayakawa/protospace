$(function(){
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".user-image.col-md-2");
        t = this;

    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        $(".media-object").attr("src", e.target.result);
        $(".media-object").show();
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
