Rails.application.routes.draw do
  get 'user_words/all_words'
  get 'user_words/known_words'
  get 'user_words/insertation_words'
  post 'user_words/add_words' => 'user_words/add_words', defaults: { format: 'json' }
  post 'user_words/make_known' => 'user_words/make_known', defaults: { format: 'json' }
  post 'user_words/make_not_word' => 'user_words/make_not_word', defaults: { format: 'json' }

  devise_for :users
  root to: 'application#single_page_app'
end
