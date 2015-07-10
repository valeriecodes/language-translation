class SitesController < ApplicationController
  load_and_authorize_resource

  def new
    @site = Site.new
  end

  def index
    @sites = Site.all
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to @site
    else
      render 'new'
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to sites_path
  end

  def show
    @site = Site.find(params[:id])
    @volunteers = User.with_role :volunteer, @site
    @contributors = User.with_role :contributor, @site
  end

  def update
    @site = Site.find(params[:id])

    if @site.update(site_params)
      redirect_to @site
    else
      render 'edit'
    end
  end

  def add_role
    @user = User.where(username: params[:username]).first
    @site = Site.find(params[:site_id])
    action = params[:act]

    if(action == 'volunteer')
      respond_to do |format|
        if @user.add_role :volunteer, @site
          format.json { render json: (User.with_role :volunteer, @site), status: :ok}
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    elsif(action == 'contributor')
      repond_to do |format|
        if @user.add_role :contributor, @site
          format.json { render json: (User.with_role :volunteer, @site), status: :ok}
        else
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  def remove_role
    @user = User.find(params[:user_id])
    @site = Site.find(params[:site_id])
    action = params[:act]

    if(action == 'volunteer')
      respond_to do |format|
        if @user.remove_role :volunteer, @site
          format.json { render json: (User.with_role :volunteer, @site), status: :ok}
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    elsif(action == 'contributor')
      repond_to do |format|
        if @user.remove_role :contributor, @site
          format.json { render json: (User.with_role :volunteer, @site), status: :ok}
        else
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  private
  def site_params
    params.require(:site).permit(:name, :installation_id)
  end

end
