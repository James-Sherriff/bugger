class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    @reports = Report.all
  end
  
  def create
    if params[:key] == Rails.application.config.app_key then
      application_urls = Application.all.pluck(:base_url)
      application_urls.each do |application_url|
        if params[:currentURL] and params[:currentURL].downcase.include? application_url.downcase then
          @application = Application.find_by(base_url: application_url)
        end
      end
      if @application.nil? then
        render json: {status: "error", message: "This app is not setup."} and return
      end
      @report = Report.create(application: @application, screenshot_base64: params[:screenshotBase64], description: params[:description], current_url: params[:currentURL], browser_version: params[:browserVersion], browser_language: params[:browserLanguage], device_resolution: params[:deviceResolution], browser_resolution: params[:browserResolution])
        
      render json: {status: "success", message: "Report submitted."}
    else
      render json: {status: "error", message: "Key invalid"}
    end
  end
    
  def show
    @report = Report.find(params[:id])
  end
end
