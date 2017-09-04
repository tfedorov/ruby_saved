class CreateIssueTrackingTables < ActiveRecord::Migration
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
      t.belongs_to :user
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
