class Users::RegistrationsController < Devise::RegistrationsController
  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)


    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @users = User.find(current_user.id)
    if @users.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @users, :bypass => true
      redirect_to after_update_path_for(@users)
    else
      render "edit"
    end
  end
end
