class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :password, :high_score, :avatar_url, :view_origin?

end
