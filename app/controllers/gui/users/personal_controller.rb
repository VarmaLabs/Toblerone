module Gui
  module Users
    class PersonalController < Gui::BaseController

      layout 'users'
      before_filter :redirect_unless_signed_in

      def my_home
        set_title("My Home | Toblerone")
      end

      def my_profile
        set_title("My Profile | Toblerone")
      end

      def update_profile
      end

    end
  end
end
