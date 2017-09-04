function UserWordCtrl($scope, httpGateWay, wordTransformator) {
    var SHOW_KNOWN_WORDS = 'known'
    var SHOW_UNKNOWN_WORDS = 'unknown'
    var INSERTATION_UNKNOWN_WORDS = 'insertation_unknown'
    var INSERTATION_NEW_WORDS = 'insertation_new'

    _syncWordsWithData = function(data) {
        $scope.words = data;
    };

    _validRawWords = function() {
        return $scope.rawWords || $scope.rawWords !== ''
    }

    $scope.addWords = function() {
        if (!_validRawWords()) {
            return;
        }
        processed_words = wordTransformator.transform_to_array($scope.rawWords)
        httpGateWay.addWords(processed_words, _syncWordsWithData);
        $scope.extractWordStrategy = INSERTATION_UNKNOWN_WORDS;
        $scope.rawWords = '';
    };
    $scope.showWords = function() {
        switch ($scope.extractWordStrategy) {
            case SHOW_KNOWN_WORDS:
                return httpGateWay.getKnownWords(true, _syncWordsWithData);
            case SHOW_UNKNOWN_WORDS:
                return httpGateWay.getKnownWords(false, _syncWordsWithData);
            case INSERTATION_UNKNOWN_WORDS:
                return httpGateWay.insertation_words(false,_syncWordsWithData)
            case INSERTATION_NEW_WORDS:
                return httpGateWay.insertation_words(true,_syncWordsWithData)
            default:
                return httpGateWay.getAllWords(_syncWordsWithData);
        }
    }

    $scope.makeAsKnown = function(wordId) {
        httpGateWay.makeAsKnown(wordId);
    }
    $scope.makeAsNotWord = function(wordId) {
        httpGateWay.makeAsNotWord(wordId);
    }

    $scope.extractWordStrategy = SHOW_UNKNOWN_WORDS;
    $scope.words = [];
    $scope.showWords();
}

myWordsApp.controller('UserWordCtrl', ['$scope','httpGateWay', 'wordTransformator', UserWordCtrl]);