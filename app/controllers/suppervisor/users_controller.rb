class Suppervisor::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save      
      flash[:success] = "Created new user"
      redirect_to suppervisor_users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      if current_user? @user
        flash[:success] = 'Profile updated'      
        redirect_to [:suppervisor, @user]
      else
        flash[:success] = 'Information changed'      
        redirect_to suppervisor_users_url
      end
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to suppervisor_users_url
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :suppervisor, :avatar
  end

  def admin_user
    if logged_in?
      unless current_user.suppervisor?
        flash[:danger] = 'Please log in by suppervisor account.'
        redirect_to root_url
      end
    else
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end    
  end
end
