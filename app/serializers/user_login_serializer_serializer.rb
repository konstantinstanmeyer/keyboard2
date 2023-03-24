class UserLoginSerializerSerializer
  # FastJsonapi currently functional for activeStorage blob queries
  include FastJsonapi::ObjectSerializer
  
  attributes :id, :email, :password, :high_score, :avatar_url
end
