class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = Application.all
  end
  
  def show
  end
  
  def new
    if can? :create, :applications then
      @application = Application.new
      @developers = User.where(role: 'developer')
    else
      redirect_to applications_path, alert: "You must be an administrator to create applications."
    end
  end
  
  def create
    if can? :create, :applications then
      @application = Application.create(application_params)
      redirect_to applications_path, notice: "Application created."
    else
      redirect_to applications_path, alert: "You must be an administrator to create new applications"
    end
  end
  
  def edit
    @application = Application.find(params[:id])
    if can? :update, @application then
      @developers = User.where(role: 'developer')
    else
      redirect_to applications_path, alert: "You must be an administrator to update applications."
    end
  end
  
  def update
    @application = Application.find(params[:id])
    if can? :update, @application then
      @application.update(application_params)
      redirect_to applications_path, notice: "Application updated."
    else
      redirect_to application_path, alert: "You must be an administrator to update an application."
    end
  end
  
  def destroy
    @application = Application.find(params[:id])
    if can? :destroy, @application then
      if @application.reports.count > 0 then
        redirect_to applications_path, alert: "You must delete all reports for this application first."
      else
        @application.destroy
        redirect_to applications_path, notice: "Application destroyed."
      end
    else
      redirect_to applications_path, alert: "You must be an administrator to delete applications."
    end
  end
    
  private
  def application_params
    params.require(:application).permit(:name, :description, :link, :url_identifier, :developers => [])
  end
end
