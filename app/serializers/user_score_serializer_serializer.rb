class UserScoreSerializerSerializer < ActiveModel::Serializer
  attributes :id, :high_score, :username, :avatar_url

  has_many :scores
end
