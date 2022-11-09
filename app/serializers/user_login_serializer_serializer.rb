class UserLoginSerializerSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :id, :email, :password, :high_score, :avatar_url
end
