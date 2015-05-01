module ProgrammableSavings
  class Launcher
    def initialize(programmable_saving, repo = ProgrammableSavingsRepository)
      @programmable_saving = programmable_saving
      @repo = repo
    end

    def self.start
      repo.start(programmable_saving, next_paydate)
    end

    private
    attr_reader :repo

    def next_paydate
      NextPayDate.calculate
    end

    # class NextPayDate

    #   def calculate
    #     current_date = DateTime.now

    #   end
    # end

  end
end