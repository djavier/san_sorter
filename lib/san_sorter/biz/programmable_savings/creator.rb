module ProgrammableSavings
  class Creator

    def initialize(repo = ProgrammableSavingsRepository)
      @repo = repo
    end

    def self.create
      new.create
    end

    def create
      repo.create(new_programmable_saving)
    end

    private
    attr_reader :repo

    def new_programmable_saving
      ProgrammableSaving.new
    end

  end
end
