(function( $ ){
  $.textSelector = function(el, callback) {
    $(el).bind('mouseup', function(){
      var st = getSelected();
      if((st!='') && isValid(st.toString())){
        callback.apply(this, [st.toString()]);
        // st.removeAllRanges(); // Non-IE
        return false;
      }
    });
  };
  
  function isValid(parm) {
    var lwr = 'abcdefghijklmnopqrstuvwxyz';
    var upr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var val = lwr + upr;
    for (i=0; i<parm.length; i++) {
      if (val.indexOf(parm.charAt(i),0) == -1) return false;
    }
    return true;
  };
  
  function getSelected() {
    var t = '';
    if(window.getSelection){
      t = window.getSelection();
    }else if(document.getSelection){
      t = document.getSelection();
    }else if(document.selection){
      t = document.selection.createRange().text;
    }
    return t;
  };
})( jQuery );