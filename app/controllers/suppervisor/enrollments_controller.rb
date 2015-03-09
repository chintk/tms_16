class Suppervisor::EnrollmentsController < ApplicationController
  before_action :admin_user

  def show
    @course = Course.find params[:course_id]
    @users = User.all
  end

  def update
    course = Course.find params[:course_id]
    if course.update_attributes enrollment_params
      flash[:success] = "Assigned!"
    else
      flash[:danger] = "Sorry! somthing get wrong, we are woking on it."
    end
    redirect_to suppervisor_courses_url
  end

  def enrollment_params
    params.require(:course).permit user_ids: []
  end

  def admin_user
    if logged_in?
      unless current_user.suppervisor?
        flash[:danger] = "Please log in by suppervisor account."
        redirect_to root_url
      end
    else
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end    
  end
end