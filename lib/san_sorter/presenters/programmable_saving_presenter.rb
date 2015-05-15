class ProgrammableSavingPresenter

	def initialize(programmable_saving)
		@programmable_saving = programmable_saving
	end

  def to_h
  	users.map(&:to_h)
  end

	private
	attr_reader :programmable_saving

	def users
		programmable_saving.users
	end
end