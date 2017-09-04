myWordsApp.factory('httpGateWay', ['$http' ,function($http){
    var DOMAINE_URL = 'user_words/';
    var httpGateWayService = {
        getAllWords: function(callback){
            $http.get(DOMAINE_URL + '/all_words').success(callback);
        },
        getKnownWords: function(isKnown, callback){
            $http.get(DOMAINE_URL + '/known_words?is_known=' + isKnown).success(callback);
        },
        addWords: function(wordsToAdd, callback){
            $http.post(DOMAINE_URL + '/add_words', { 'words': wordsToAdd}).success(callback);
        },
        makeAsKnown: function(wordId, callback){
            $http.post(DOMAINE_URL + '/make_known', { 'id': wordId}).success(callback);
        },
        makeAsNotWord: function(wordId, callback){
            $http.post(DOMAINE_URL + 'make_not_word', { 'id': wordId}).success(callback);
        },
        insertation_words: function(isKnown, callback){
            $http.get(DOMAINE_URL + 'insertation_words?is_known=' + isKnown).success(callback);
        }

    }
    return httpGateWayService;
}]);