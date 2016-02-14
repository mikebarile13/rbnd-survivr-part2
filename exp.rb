class Tribe

	attr_reader :name, :members

	def initialize(details)
		@name = details[:name].capitalize
		@members = details[:members]
		p "Tribe #{@name} has been created!"
	end

end

class Contestant

	attr_reader :name

	def initialize(name)
		@name = name.capitalize
  	end

  	def to_s
    	@name
  	end

end


contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
contestants.map!{ |contestant| Contestant.new(contestant) }
coyopa = Tribe.new({name: "Pagong", members: contestants.shift(10)})

p coyopa.name

