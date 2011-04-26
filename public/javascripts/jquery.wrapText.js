/** 
 inspired by http://devthought.com/
*/
(function( $ ){
  $.fn.wrapText = function(search, insensitive){
     var regex = new RegExp('(<[^>]*>)|(\\b'+ search.replace(/([-.*+?^${}()|[\]\/\\])/g,"\\$1") +')', insensitive ? 'ig' : 'g');
     return this.html(this.html().replace(regex, function(a, b, c){
         return (a.charAt(0) == '<') ? a : '<strong><i>'+ c + '</i></strong>';
     }));
   };
})( jQuery );
