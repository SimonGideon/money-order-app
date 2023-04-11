class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    protected
    # redirect to log in after signing up
      def after_sign_up_path_for(resource)
        new_user_session_path
      end
    # redirects to home after signing in
      def after_sign_in_path_for(resource)
        groups_path
      end
end
