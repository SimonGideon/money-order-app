class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    protected
    def after_sign_up_path_for(resource)
        new_user_session_path
      end
end
