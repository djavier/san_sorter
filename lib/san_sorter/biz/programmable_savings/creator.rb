module ProgrammableSavings
  class Creator

    def initialize(repo = ProgrammableSavingsRepository)
      @repo = repo
    end

    def self.create(pool_amount)
      new.create(pool_amount)
    end

    def create(pool_amount)
      programmable_saving = new_programmable_saving(pool_amount)
      repo.create(programmable_saving)
    end

    private
    attr_reader :repo

    def new_programmable_saving(pool_amount)
      ProgrammableSaving.new(pool_amount: pool_amount)
    end

  end
end
