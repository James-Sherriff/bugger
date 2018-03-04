class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    @reports = Report.all
    puts @reports.length
  end
  
  def create
    puts "KEY - " + params[:key].inspect
    puts "MY KEY - " + Rails.application.config.app_key.inspect
    if params[:key] == Rails.application.config.app_key then
      application_urls = Application.all.pluck(:base_url)
      application_urls.each do |application_url|
        if params[:url].include? application_url then
          @application = Application.find_by(base_url: application_url)
        end
      end
      if @application.nil? then
        render json: {status: "error", message: "This app is not setup."} and return
      end
      @report = Report.create(application: @application, screenshot_base64: params[:screenshotBase64], description: params[:description])
        
      render json: {status: "success", message: "Report submitted."}
    else
      render json: {status: "error", message: "Key invalid"}
    end
  end
    
  def show
    @report = Report.find(params[:id])
  end
end
