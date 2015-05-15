module ProgrammableSavings
  class Launcher

    def initialize(programmable_saving, repo = ProgrammableSavingsRepository)
      @programmable_saving = programmable_saving
      @repo = repo
    end

    def start
      programmable_saving.start_date = next_paydate

      ProgrammableSavingPresenter.new(
          repo.update(programmable_saving)
        )
    end

    private
    attr_reader :repo, :programmable_saving

    private


    def next_paydate
      NextPayDate.calculate
    end

  end
end
