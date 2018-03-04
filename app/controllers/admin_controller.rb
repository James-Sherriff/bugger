class AdminController < ApplicationController
  def index
    if current_user.admin? then
      @administrators = User.where(role: 'admin')
      @developers = User.where(role: 'developer')
    else
      redirect_to root_path, alert: "You must be an administrator to do that."
    end
  end
  
  def update_user
    if can? :update, :users then
      @user = User.find_by(email: params[:email])
      if @user then
        if params[:role] == "1" then
          @user.update(role: "admin")
        else
          @user.update(role: "developer")
        end   
      else
        if params[:role] == "1" then
          @user = User.create(email: params[:email], role: "admin")
        else
          @user = User.create(email: params[:email], role: "developer", password: Devise.friendly_token(length = 20))
        end
      end
      redirect_to admin_index_path, notice: "User updated."
    else
      redirect_to index_path, notice: "You must be an administrator to do that."
    end
  end
end
