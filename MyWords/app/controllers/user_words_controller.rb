class UserWordsController < ApplicationController
  before_action :authenticate_user!

  def all_words
    render json: word_service.all_words
  end

  def known_words
    render json: word_service.known_words(known_parameter)
  end

  def add_words
    add_processor = WordsInsertationProcessor.new(current_user)
    result = add_processor.make_insertaion_word(add_words_params)
    render json: result
  end

  def make_known
    render json: word_service.make_known(params.require('id'))
  end

  def make_not_word
    render json: word_service.make_not_word(params.require('id'))
  end

  def insertation_words
    render json: word_service.last_insertation(known_parameter)
  end

  private

  def known_parameter
    'true' == params.require('is_known')
  end

  def word_service
    @word_service ||= UserWordsService.new(current_user)
  end

  def add_words_params
    params.require(:words)
    params.permit(:description, words: [])
  end
end
