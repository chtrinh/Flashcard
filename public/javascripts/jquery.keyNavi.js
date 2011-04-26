(function( $ ){
  $.keyNavi = function(leftCallback, rightCallback, upCallback, downCallback){
    $(document).bind("keydown", function(e){
      var keyCode = e.keyCode || e.which,
            arrow = {left: 37, right: 39, up: 38, down: 40};
            
      switch (keyCode) {
        case arrow.left:
          leftCallback.apply(this);
        break;
        case arrow.right:
          rightCallback.apply(this);
        break;
        case arrow.up:
          upCallback.apply(this);
        break;
        case arrow.down:
          downCallback.apply(this);
        break;
      }
    });
  };  
})( jQuery );