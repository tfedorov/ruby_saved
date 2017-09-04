Rails.application.routes.draw do

  devise_for :users
  get 'first/show'

  mount IssueTracking::Engine => "/issue_tracking"
end
