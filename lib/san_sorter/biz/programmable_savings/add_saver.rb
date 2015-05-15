module ProgrammableSavings
  class Join
    def initialize(programmable_saving, repo = UsersRepository)
      @programmable_saving = programmable_saving
      @repo = repo
    end

    def self.join(saver_name, ticket_count = 1)
      new.join(saver_name, ticket_count)
    end

    def join(saver_name, ticket_count)
      # Joins the Saver to the Programmable Saving
      # with X amount of tickets
    end

    private
    attr_reader :programmable_saving, :repo

  end
end
