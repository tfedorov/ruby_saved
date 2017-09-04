require "issue_tracking/engine"
#
module IssueTracking
  def self.setup(&block)
    yield Engine.config if block
    Engine.config
  end

  def self.config
    Rails.application.config
  end

  def self.authentificator
    @authentificator ||= StaffAuthService::AuthStrategyFactory.extract(config.auth_strategy)
  end

  def self.staff_table_name
    config.staff_table || :users
  end

  def self.staff_id_column_name
    config.staff_table_id_column || :id
  end

  def self.staff_name_column
    config.staff_table_name_column || :email
  end
end
