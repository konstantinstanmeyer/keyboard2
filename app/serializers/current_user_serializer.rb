class CurrentUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :high_score, :avatar_url
end
