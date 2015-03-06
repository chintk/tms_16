class ReportsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    if current_user?(@user) && current_course
      @subjects = current_course.subjects
    end
  end
end
