collection :users do
  entity     User
  repository UsersRepository

  attribute :id,   Integer
  attribute :name, String
end