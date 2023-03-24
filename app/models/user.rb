require 'pry'

class User < ApplicationRecord
  # allows file to be attached to a user within the avatar key's value | using activeStorage
  # establish one-to-many relationship for user -> scores
  has_one_attached :avatar
  has_many :scores
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # grabs a user's profile picture is the value is present within its instance
  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

end
