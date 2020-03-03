# frozen_string_literal: true
class User# < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :id, :email, :created_at, :updated_at, :provider, :uid
end
