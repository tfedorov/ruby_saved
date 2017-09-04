IssueTracking.setup do |config|
  config.auth_strategy = 'devise_strategy'
  config.staff_table = 'user'
  config.staff_table_id_column = 'id'
  config.staff_table_name_column = 'email'
end
