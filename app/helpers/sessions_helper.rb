# Helper methods defined here can be accessed in any controller or view in the application

module PadrinoBlog
  class App
    module SessionsHelper
      def current_user
        session[:user]
      end

      def signed_in?
        session[:user]
      end
    end

    helpers SessionsHelper
  end
end
