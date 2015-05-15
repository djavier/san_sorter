class ProgrammableSaving
  include Lotus::Entity

  attributes :name, :start_date

  def users(repo = UsersRepository)
  	@users ||= repo.find_by_programmable_saving(self)
  end

end

