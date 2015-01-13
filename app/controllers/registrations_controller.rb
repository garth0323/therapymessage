class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    binding.pry
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :type)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :type, :current_password)
  end
end