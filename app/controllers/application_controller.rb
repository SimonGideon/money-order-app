class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected
    def after_sign_up_path_for(resource)
        new_user_session_path
      end
end
