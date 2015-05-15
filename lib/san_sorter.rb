require 'lotus/model'
Dir["#{ __dir__ }/san_sorter/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  adapter type: :memory, uri: 'memory://localhost/database'

  mapping do

    collection :programmable_savings do
      entity ProgrammableSaving
      repository ProgrammableSavingsRepository

      attribute :id, Integer
      attribute :start_date, DateTime
    end

    collection :users do
      entity User
      repository UsersRepository

      attribute :id, Integer
      attribute :name, String
    end

  end

end.load!
