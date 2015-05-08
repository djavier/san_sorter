require 'lotus/model'
Dir["#{ __dir__ }/san_sorter/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter

  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/san_sorter_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/san_sorter_development'
  #    adapter type: :sql, uri: 'mysql://localhost/san_sorter_development'
  #
  # adapter type: :file_system, uri: ENV['SAN_SORTER_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  adapter type: :memory, uri: 'memory://localhost/san_sorter_development'
  mapping "#{__dir__}/config/mapping"

end.load!
