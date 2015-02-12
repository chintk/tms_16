class TasksController < ApplicationController
  def show
    @user = Task.find params[:id]
  end
end