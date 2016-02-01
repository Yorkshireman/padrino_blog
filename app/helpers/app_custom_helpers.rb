module PadrinoBlog
  class App
    module AppCustomHelpers
      def current_user
        session[:user]
      end

      def signed_in?
        session[:user]
      end
    end

    helpers AppCustomHelpers
  end
end