class ReportsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    if current_user? @user
      @course = current_course
      @subjects = @course.subjects
    end
  end
end
