class UsersRepository

  include Lotus::Repository

  def self.by_name(user_name)
  	query do
  		where(name: user_name).limit(1)
  	end.first
  end

  # def self.add_to_programmable_saving(user_name, programmable_saving_id, ticket_count)
  # 	# user_id = by_name(user_name).id

  # 	# relation = Ticket.new(
  # 	# 	programmable_saving_id: programmable_saving_id,
  # 	# 	ticket_count: ticket_count,
  #  #    user_id: user_id
  # 	# )

  # 	relations_repo.create(relation)
  # end

  private

  def self.relations_repo
  	TicketsRepository
  end

end


class TicketsRepository
	include Lotus::Repository

	def self.by_programmable_saving(programmable_saving_id)
		query do
			where(programmable_saving_id: programmable_saving_id)
		end
	end

end

class Ticket
	include Lotus::Entity
	attributes :user_id, :programmable_saving_id, :pay_date, :order
end
