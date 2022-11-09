class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :score, :accuracy, :style, :word_length
end
