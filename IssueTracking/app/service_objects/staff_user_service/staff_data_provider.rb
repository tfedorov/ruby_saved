module IssueTracking
  #
  module StaffUserService
    #
    class StaffDataProvider
      require 'singleton'
      include Singleton

      def initialize
        @user_table = Arel::Table.new(IssueTracking.staff_table_name)
        @staff_name_column = IssueTracking.staff_name_column
        @staff_id_column = IssueTracking.staff_id_column_name
      end

      def staffs
        query = @user_table.project(@staff_name_column, @staff_id_column)
        exec_querry(query)
      end

      def staff_by_user_id(user_id)
        query = @user_table.project(@staff_name_column)
                .where(@user_table[@staff_id_column].eq(user_id)).take(1)
        exec_querry(query)
      end

      private

      def exec_querry(query)
        ActiveRecord::Base.connection.execute(query.to_sql)
      end
    end
  end
end
