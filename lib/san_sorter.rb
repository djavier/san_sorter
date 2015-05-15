require 'lotus/model'
Dir["#{ __dir__ }/san_sorter/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  adapter type: :memory, uri: 'memory://localhost/database_test'

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

    collection :ticket do
      entity Ticket
      repository TicketsRepository

      attribute :id, Integer
      attribute :user_id, Integer
      attribute :programmable_saving_id, Integer
      attribute :order, Integer
      attribute :pay_date, DateTime
    end

  end

end.load!
