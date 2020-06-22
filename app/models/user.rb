# frozen_string_literal: true

class User < ApplicationRecord
  has_many :favorites
  has_many :items
  has_secure_password
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  mount_uploader :image, ImageUploader
end
