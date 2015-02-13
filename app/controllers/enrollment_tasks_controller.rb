class EnrollmentTasksController < ApplicationController
  before_action :logged_in_user

  def update
    @enrollment_task = current_user.enrollment_tasks.find params[:id]
    if @enrollment_task.update_attributes(task_params)
      flash[:success] = 'Tasks updated'
      redirect_to enrollment_subjects_url
    else
      redirect_to enrollment_subjects_url
    end
  end

  private
  def task_params
    params.require(:enrollment_task).permit(:status)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end