class Suppervisor::SubjectsController < ApplicationController
  before_action :admin_user

  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def show
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes(subject_params)
      flash[:success] = 'Information changed'      
      redirect_to suppervisor_subjects_url
    else
      render 'show'
    end
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      redirect_to suppervisor_subjects_url
    else
      render 'new'
    end
  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = 'Subject deleted'
    redirect_to suppervisor_subjects_url
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :description, tasks_attributes: [:id, :name, :description, :_destroy])
  end

  def admin_user
    if logged_in?
      unless current_user.suppervisor?
        flash[:danger] = 'Please log in by suppervisor account.'
        redirect_to(root_url)
      end
    else
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end    
  end
end