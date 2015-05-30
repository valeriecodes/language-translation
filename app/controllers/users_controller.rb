class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :set_user, only: [:edit, :show, :destroy, :update]

  def index
    #TODO .where(organization_id: current_organization.id)

    if params[:q].blank?
      @users = User.paginate(page: params[:page], per_page: 20)
    else
      @users = User.user_search(params[:q]).paginate(page: params[:page], per_page: 20)
    end
  end

 def new
  @user = User.new
 end

 def create
  @user = User.new(user_params)
 
  if @user.save
   redirect_to @user
  else
   render 'new'
  end
 end

 def edit
 end

 def destroy
  @user.destroy
 
  redirect_to users_path
 end

 def show
 end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
 
 private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :location, :lang, :contact, :gender, :role, :login_approval)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
