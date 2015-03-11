class StaticPagesController < ApplicationController
  def home
    if current_user && !current_course.nil?
      if current_user.suppervisor?
        @activities = Activity.paginate page: params[:page], per_page: 10
      else
        @activities = current_course.activities.paginate page: params[:page], per_page: 10
      end
    end
  end
end
