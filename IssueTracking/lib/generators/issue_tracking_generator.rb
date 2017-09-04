class IssueTrackingGenerator < Rails::Generators::Base
  argument :table_name, type: :string, default: 'users'
  argument :table_id, type: :string, default: 'id'
  argument :table_column_name, type: :string, default: 'email'

  TABLE_NAME_MARKUP = '#[_____TABLE_NAME____]#'
  TABLE_ID_MARKUP = '#[_____TABLE_ID____]#'
  TABLE_COLUMN_MARKUP = '#[_____TABLE_COLUMN____]#'

  def create_initializer_file
    migration_file = <<-FILE
class CreateIssueTracking < ActiveRecord::Migration
  def change
    create_table :issue_tracking_statuses do |t|
      t.string :status
      t.timestamps null: false
    end
    IssueTracking::Status.create status: 'Waiting for Staff Response'
    IssueTracking::Status.create status: 'Waiting for Customer'
    IssueTracking::Status.create status: 'On hold'
    IssueTracking::Status.create status: 'Cancelled'
    IssueTracking::Status.create status: 'Completed'

    create_table :issue_tracking_replies do |t|
      t.belongs_to :ticket, index: true
      t.belongs_to :status, index: true
      t.belongs_to :#[_____TABLE_NAME____]#
      t.string :reply_text
      t.timestamps null: false
    end

    create_table :issue_tracking_tickets do |t|
      t.belongs_to :reply, index: true
      t.string :unique_reference
      t.string :url
      t.string :subject
      t.string :body
      t.string :department
      t.string :customer
      t.string :first_name, :last_name, :email

      t.timestamps null: false
    end
  end
end
    FILE
    migration_file.gsub!(TABLE_NAME_MARKUP, table_name.singularize)

    create_file 'db/migrate/50151116193616_create_issue_tracking.rb', migration_file

    initializer_file = <<-FILE
IssueTracking.setup do |config|
  config.auth_strategy = 'devise_strategy'
  config.staff_table = '#[_____TABLE_NAME____]#'
  config.staff_table_id_column = '#[_____TABLE_ID____]#'
  config.staff_table_name_column = '#[_____TABLE_COLUMN____]#'
end
    FILE
    initializer_file.gsub!(TABLE_NAME_MARKUP, table_name)
    initializer_file.gsub!(TABLE_ID_MARKUP, table_id)
    initializer_file.gsub!(TABLE_COLUMN_MARKUP, table_column_name)
    create_file 'config/initializers/issue_tracking.rb', initializer_file
  end
end
