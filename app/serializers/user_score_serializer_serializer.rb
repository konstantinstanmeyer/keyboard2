class UserScoreSerializerSerializer < ActiveModel::Serializer
  attributes :id, :high_score, :username, :avatar_url, :view_profile?, :view_high_score?

  has_many :scores
end
