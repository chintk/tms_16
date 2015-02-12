class EnrollmentSubjectsController < ApplicationController
  before_action :logged_in_user

  def index
    @enrollment_subjects = current_user.enrollment_subjects.all
  end

  def update
    @enrollment_subject = current_user.enrollment_subjects.find params[:id]
    if @enrollment_subject.update_attributes(subject_params)
      flash[:success] = 'Subject updated'
      redirect_to enrollment_subjects_url
    else
      render 'index'
    end
  end

  private
  def subject_params
    params.require(:enrollment_subject).permit(:status)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end