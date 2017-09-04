# Issue-Tracking
A simple system for tracking incoming enquiries from customers with an easy to use interface for support staff to  communicate with clients.


For using

* set mail into options into config/environment.rb
* create rails app
* rails generate devise:install
* rails generate devise user
* rails generate issue_tracking users id email
* add to routes 'mount IssueTracking::Engine => "/issue_tracking"'
* rails s

usage

* http://localhost:3000/issue_tracking/customer/tickets/new
create ticket


customer auth

* http://localhost:3000/issue_tracking/staff/unassigned_tickets

* http://localhost:3000/issue_tracking/staff/open_tickets

* http://localhost:3000/issue_tracking/staff/all_tickets

click for link for example
http://localhost:3000/issue_tracking/staff/tickets/HET-FC-HET-EE-HET/reply
create reply

This app engine does not use self auth mechanism.
But IssueTracking get auth from main app. You should set in file

* config/initializers/issue_tracking.rb

* config.auth_strategy = 'devise_strategy' # or another one
By default it is DeviseAuthStratege,
But You could customize it.

* app/service_objects/staff_auth_service/auth_strategy_factory.rb

* app/service_objects/staff_auth_service/devise_auth_strategy.rb
