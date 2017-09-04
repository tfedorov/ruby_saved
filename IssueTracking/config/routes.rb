IssueTracking::Engine.routes.draw do
  namespace :staff do
    get '/unassigned_tickets', to: 'replies_list#unassigned'
    get '/open_tickets', to: 'replies_list#open'
    get '/all_tickets', to: 'replies_list#all'
    post 'reply_search/search_subject', to: 'replies_list#search_subject'
    post 'reply_search/search_words', to: 'replies_list#search_words'
    get '/reply_search/search_reference', to: 'create_reply#search_reference'
    scope '/tickets/:ticket_id/' do
      get 'reply', to: 'create_reply#new'
      post 'reply', to: 'create_reply#create'
    end
  end

  namespace :customer do
    resources :tickets, only: [:new, :create, :show]
    post '/tickets/:id', to: 'tickets#update'
  end
end
