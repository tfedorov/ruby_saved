module IssueTracking
  #
  module StaffUserService
    #
    module StaffFormatter
      private_class_method

      def ids_names(stafs)
        stafs.map { |staff| [staff[0], staff[1]] }
      end

      def unique_name(stafs)
        stafs_names = stafs.map { |staff| [staff[0]] }
        return '' unless stafs_names.present?
        stafs_names.first[0]
      end
    end
  end
end
