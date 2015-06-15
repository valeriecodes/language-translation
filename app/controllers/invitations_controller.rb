class InvitationsController < Devise::InvitationsController

  private
  def invite_params
    params.require(resource_name).permit(:email, :first_name, :last_name, :role_id)
  end

  def update_resource_params
    params.require(resource_name).permit(:username, :invitation_token, :password, :password_confirmation)
  end
end
