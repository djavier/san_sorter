module Users
  class Creator

    def initialize(repo = UsersRepository)
      @repo = repo
    end

    def create(creator_name)
      repo.create(new_user(name: creator_name))
    end

    def self.create(creator_name)
      new.create(creator_name)
    end

    private
    attr_reader :repo

    def new_user(attributes = {})
      User.new(attributes)
    end

  end
end