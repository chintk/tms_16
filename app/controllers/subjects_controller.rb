class SubjectsController < ApplicationController
  before_action :logged_in_user

  def index
    @subjects = current_user.subjects.all
  end

  def show
    @subject = current_user.subjects.find params[:id]
    @tasks = @subject.tasks.all
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