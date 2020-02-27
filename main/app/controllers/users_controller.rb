class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :edit]
  
  def show
    if user = User.where(id: params[:id]).first
      render json: user
    else
      head :not_found
    end 
  end

  def edit
    @user = User.where(id: params[:id]).first
    authorize @user
    render json: {result: "OK"}
  rescue Pundit::NotAuthorizedError => e
    head :unauthorized
  end
end
