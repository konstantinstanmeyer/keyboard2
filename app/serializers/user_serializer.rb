class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :password, :high_score, :avatar_url, :view_origin?, :username, :view_profile?, :view_high_score?

  has_many :scores
end
