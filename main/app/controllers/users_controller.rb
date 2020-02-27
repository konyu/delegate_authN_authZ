class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  
  def show
    render json: User.where(params[:id]).first
  end
end
