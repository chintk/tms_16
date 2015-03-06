class StaticPagesController < ApplicationController
  def home
    if current_user && !current_course.nil?
      @activities = current_course.activities.paginate page: params[:page]
    end
  end
end
