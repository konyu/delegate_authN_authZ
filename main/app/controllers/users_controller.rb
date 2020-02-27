class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  
  def show
    if user = User.where(id: params[:id]).first
      render json: user
    else
      head :not_found
    end 
  end
end
