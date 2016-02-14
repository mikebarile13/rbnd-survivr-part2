class Game

	attr_reader :tribes

	def initialize(tribe_1, tribe_2)
		@tribes = [tribe_1, tribe_2]
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		losing_tribe = @tribes.shuffle.first
		p "#{losing_tribe} has lost the immunity challenge!"
		losing_tribe
	end

	def individual_immunity_challenge
		immune = @tribes[0].members.shuffle.first
		p "#{immune} has won the immunity challenge!"
		immune
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