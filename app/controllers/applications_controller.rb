class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end
  
  def show
  end
  
  def new
  end
  
  def create
    @application = Application.create(name: params[:name], description: params[:description], base_url: params[:base_url])
    redirect_to applications_path
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @application = Application.find(params[:id])
    if @application.reports.count > 0 then
      redirect_to applications_path, alert: "You must delete all reports for this application first."
    else
      @application.destroy
      redirect_to applications_path, notice: "Application destroyed."
    end
  end
end
