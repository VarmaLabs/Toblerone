module Gui
  class BaseController < ActionController::Base

    protect_from_forgery with: :exception

    include ParamsParserHelper
    include FlashHelper
    include NavigationHelper
    include TitleHelper

    def current_user
      @current_user ||= User.find_by_id(session[:id])
    end

    def store_session
      session[:id] = @current_user.id
    end

    def destroy_session
      session.delete(:id)
      @current_user = nil
    end

    def require_user
      unless current_user
        store_flash_message("You need to login to access this page", :error)
        redirect_to redirect_url_if_sign_in_fails
      end
    end

    def redirect_url_if_sign_in_fails
      sign_in_url
    end

    def redirect_url_after_sign_in
      my_home_url
    end

    def redirect_url_after_sign_out
      sign_in_url
    end

    def redirect_if_signed_in
      redirect_to redirect_url_after_sign_in if current_user
    end

    def redirect_unless_signed_in
      redirect_to redirect_url_if_sign_in_fails unless current_user
    end

  end
end
