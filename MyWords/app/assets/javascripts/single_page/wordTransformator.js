myWordsApp.factory('wordTransformator', [function(){
    var _text_transform = function(text){
        return text.toLowerCase().trim().replace(/[^a-zA-Z-]/g, ' ').replace(/( )+/g,' ')
    };
    var wordTransformator = {
          transform_to_array: function(rawWords) {
            return _text_transform(rawWords).split(' ')
        }
    }
    return wordTransformator;
}]);