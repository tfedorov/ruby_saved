require 'test_helper'

module IssueTracking
  class Customer::TicketsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get create" do
      get :create
      assert_response :success
    end

    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
