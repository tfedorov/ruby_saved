module IssueTracking
  #
  module StaffUserService
    #
    class StaffExctractor
      extend StaffUserService::StaffFormatter

      def self.staffs
        staffs_data = StaffDataProvider.instance.staffs
        ids_names(staffs_data)
      end

      def self.staff_name(user_id)
        staffs = StaffDataProvider.instance.staff_by_user_id(user_id)
        unique_name(staffs)
      end
    end
  end
end
