module Gui
  class SessionsController < Gui::BaseController

    layout 'public'
    before_filter :set_heading
    before_filter :redirect_if_signed_in, :except => :destroy
    before_filter :redirect_unless_signed_in, :only => :destroy

    def new
    end

    def create
      login_handle = params[:login_handle]
      password = params[:login_password]

      # Fetching the user data (email / username is case insensitive.)
      @user = User.find_by_email_or_username(params['login_handle'])

      @success = false

      # If the user exists with the given username / password
      if @user

        # Check if the user is not approved (pending, locked or blocked)
        # Will allow to login only if status is approved
        if @user.status != ConfigCenter::User::APPROVED
          @alert = I18n.translate("authentication.user_is_#{@user.status.downcase}")

        # Check if the password matches
        # Invalid Login: Password / Email doesn't match
        elsif @user.authenticate(params['password']) == false
          @alert = I18n.translate("response.invalid_login_error")
        end

        @success = true

      # If the user with provided email doesn't exist
      else
        store_flash_message("Invalid Login Handle or Password", :error)
        @alert = I18n.translate("response.invalid_login_error")
      end

      if @success
        @current_user = @user
        store_session
        redirect_to redirect_url_after_sign_in
      else
        store_flash_message(@alert, :error)
        render :new
      end
    end

    def destroy
      store_flash_message("You have successfully signed out", :notice)

      # Reseting the auth token for user when he logs out.
      @current_user.update_attribute :auth_token, SecureRandom.hex

      destroy_session

      redirect_to redirect_url_after_sign_out
    end

    def set_heading
      set_title("Sign In | Toblerone")
    end

  end
end
