module PadrinoBlog
  class App
    module UsersControllerHelpers

      def password_confirmation_filled_in?
        params[:user][:password_confirmation] != ""
      end

      def password_and_password_confirmation_mismatch?
        password_confirmation_filled_in? && 
        (params[:user][:password] != params[:user][:password_confirmation])
      end

    end

    helpers UsersControllerHelpers
  end
end