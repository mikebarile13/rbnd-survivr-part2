class Game

	attr_reader :tribes

	def initialize(tribe_1, tribe_2)
		@tribes = [tribe_1, tribe_2]
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		@tribes.shuffle.first
	end

	def individual_immunity_challenge
		@tribes[0].members.shuffle.first
	end

	def clear_tribes
		tribes.clear
	end

	def merge(name)
		new_members = @tribes[0].members.concat(@tribes[1].members)
		@merged_tribe = Tribe.new({name: name, members: new_members})
		self.clear_tribes
		self.add_tribe(@merged_tribe)
		@merged_tribe
	end

end