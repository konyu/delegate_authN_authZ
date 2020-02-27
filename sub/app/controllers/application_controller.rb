# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def home
    # binding.irb
    # current_user
    # 任意のコントローラでcurrent_userを取得できる
  end

  protected

  # authenticate_{group_name}などdeviseの深いところを考慮すると共通で読んでいるwardenメソッドの返り値のクラスでauthenticateメソッドを定義してやればいいかも
  # authenticate!やauthenticate?も多分呼ばれるだろう
  def warden
    user_id = session["warden.user.user.key"][0][0]
    Warden.new(user_id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end

  class Warden
    attr_reader :user_id

    def initialize(user_id)
      @user_id = user_id
    end
    # TODO *argsの可変長引数は適当
    def authenticate(*args)
      url = "http://main.dev.local:3000/users/#{user_id}"
      json = Net::HTTP.get(URI.parse(url))
      hash = JSON.parse(json)
      User.new(hash)
    end

    def authenticate!(*args)
      raise "TODO raise error" if authenticate.nil?
    end

    def authenticate?(*args)
      authenticate.nil?
    end
  end
end
