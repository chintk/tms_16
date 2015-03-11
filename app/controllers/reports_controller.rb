class ReportsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    if current_user?(@user) && current_course
      @subjects = current_course.subjects.paginate page: params[:page], per_page: 10
    end
  end
end
