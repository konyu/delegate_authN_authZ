# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def authenticate_user!
    if current_user.blank?
      raise "No Authentication"
    end
  end

  def current_user
    return @current_user if @current_user.present?
    # Cookieセッションの場合はこれで取れる
    user_id = session.dig("warden.user.user.key", 0, 0)
    raise "UserId No Found" if user_id.blank?
      
    url = "http://main.dev.local:3000/users/#{user_id}"
    json = Net::HTTP.get(URI.parse(url))
    hash = JSON.parse(json)
    user = User.new(hash)
    if user.blank?
      raise "User Not Found"
    else
      @current_user = user
    end
  end

  def home
  end

  def edit
    authorize current_user
    redirect_to "/"
  end

  protected
end
