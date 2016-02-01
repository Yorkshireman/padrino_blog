module PadrinoBlog
  class App
    module SessionsControllerHelpers

      def user_exists_and_password_is_correct? user
        user && user.authenticate(params[:password])
      end

    end

    helpers SessionsControllerHelpers
  end
end