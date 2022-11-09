class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :score, :accuracy, :style
end
