class Jury

	attr_accessor :members
	attr_reader :jury_votes

	def initialize
		@members = []
		@jury_votes = {}
	end

	def add_member(name)
		@members << name
	end

	def members
		@members
	end

	def cast_votes(finalists)
		@jury_votes = Hash[*finalists.zip([0,0]).flatten]
		members.each do |member| 
			vote = finalists.shuffle.first
			p "#{member.name} has voted for #{vote.name}!"
			@jury_votes[vote] += 1
		end
		return @jury_votes
	end

	def report_votes(final_votes)
		final_votes.each {|finalist, vote_count| p "#{finalist.name}: #{vote_count}"}
	end

	def announce_winner(final_votes)
		winner = ["null", 0]
		final_votes.each do |finalist, vote_count|
			if vote_count > winner[1]
				winner[0] = finalist
				winner[1] = vote_count
			end
		end
		return winner[0]
	end

end