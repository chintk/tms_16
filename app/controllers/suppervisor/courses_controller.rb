class Suppervisor::CoursesController < ApplicationController
  before_action :admin_user

  def index
    @courses = Course.paginate page: params[:page], per_page: 10
  end

  def create	
    @course = Course.new course_params
    if @course.save
      redirect_to suppervisor_courses_url
    else
      render 'new'
    end
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects.paginate page: params[:page], per_page: 10
  end

  def edit
    @course = Course.find params[:id]
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    redirect_to suppervisor_courses_url
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params      
      flash[:success] = "Updated!"
      redirect_to [:suppervisor, @course]
    else
      render 'edit'
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :begin, :end
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