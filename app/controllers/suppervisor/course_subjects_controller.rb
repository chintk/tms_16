class Suppervisor::CourseSubjectsController < ApplicationController
  before_action :admin_user

  def show
    @course = Course.find params[:course_id]
    @subjects = Subject.all
  end

  def edit
    @course_subject = CourseSubject.find params[:id]
  end

  def update
    if params[:id]
      @course_subject = CourseSubject.find params[:id]
      @course_subject.update_attributes course_subject_finish_params
      flash[:success] = "Subject finished!"
      redirect_to [:suppervisor, @course_subject.course]
    else
      @course = Course.find params[:course_id]
      if @course.update_attributes course_subject_params
        flash[:success] = "Assigned!"
        redirect_to [:suppervisor, @course]
      else
        flash[:error] = "Sorry! somthing get wrong, we are woking on it."
        redirect_to suppervisor_course_course_subjects_path params[:course_id]
      end
    end
  end

  private
  def course_subject_params
    params.require(:course).permit subject_ids: []
  end

  def course_subject_finish_params
    params.require(:course_subject).permit :end
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
