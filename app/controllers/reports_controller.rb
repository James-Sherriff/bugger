class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!, except: [:create]
  
  def index
    @reports = Report.all.order(created_at: :desc)
  end
  
  def create
    if params[:key] == Rails.application.config.app_key then
      application_url_identifiers = Application.all.pluck(:url_identifier)
      application_url_identifiers.each do |application_url_identifier|
        if params[:currentURL] and params[:currentURL].downcase.include? application_url_identifier.downcase then
          @application = Application.find_by(url_identifier: application_url_identifier)
        end
      end
      if @application.nil? then
        render json: {status: "error", message: "This app is not setup."} and return
      end
      ref_code = SecureRandom.hex(5)
      while(Report.find_by(ref_code: ref_code) != nil) do
        ref_code = SecureRandom.hex(5)
      end
      @report = Report.create(ref_code: SecureRandom.hex(5), application: @application, screenshot_base64: params[:screenshotBase64], description: params[:description], current_url: params[:currentURL], browser_version: params[:browserVersion], browser_language: params[:browserLanguage], device_resolution: params[:deviceResolution], browser_resolution: params[:browserResolution])
        
      render json: {status: "success", message: "Report submitted."}
    else
      render json: {status: "error", message: "Key invalid"}
    end
  end
    
  def show
    @report = Report.find_by(ref_code: params[:id])
  end
    
  def edit
    @report = Report.find_by(ref_code: params[:id])
  end
      
  def update
    @report = Report.find_by(ref_code: params[:id])
    if can? :update, @report then
      @report.update(status: params[:status])
      ReportUpdate.create(status: params[:status], user: current_user, report: @report, description: params[:description])
      redirect_to report_path(params[:id])
    else
      redirect_to reports_path
    end
  end
      
  def update_status
    @report = Report.find_by(ref_code: params[:id])
    if can? :update, @report then
      @report.update(status: params[:status])
      redirect_to reports_path, notice: "Status updated."
    else
      redirect_to reports_path, alert: "You don't have permission to update the status of that report."
    end
  end
  
  def archive
    @report = Report.find_by(ref_code: params[:id])
    if can? :update, @report then
      @report.update(status: 3)
      redirect_to reports_path, notice: "Archived report."
    else
      redirect_to reports_path, alert: "You don't have permission to archive this report."
    end
  end
      
  private
  def report_params
    params.require(:report).permit(:priority)
  end
end
