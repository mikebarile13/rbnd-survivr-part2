class Tribe

	attr_reader :name, :members

	def initialize(details)
		@name = details[:name].to_s.capitalize
		@members = details[:members]
		p "Tribe #{@name} has been created!"
	end

	def tribal_council(immune)
		voted_off = immune
		while voted_off == immune  do
			voted_off = members.shuffle.first
		end
		return voted_off
	end

	def to_s
		@name
	end

end