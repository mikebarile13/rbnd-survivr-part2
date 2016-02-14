class Tribe

	attr_reader :name, :members

	def initialize(details)
		@name = details[:name].to_s.capitalize
		@members = details[:members]
		puts "Tribe #{@name.blue} has been created!"
	end

	def tribal_council(immune = "not_relevant")
		voted_off = immune
		while voted_off == immune   do
			voted_off = members.shuffle.first
		end
		return voted_off
	end

	def remove_from_tribe(voted_off)
		puts "#{voted_off.name.red} has been removed from the tribe!"
		@members.delete(voted_off)
	end

	def to_s
		@name
	end

end