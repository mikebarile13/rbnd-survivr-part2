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
			puts "#{member.name.pink} has voted for #{vote.name.yellow}!"
			@jury_votes[vote] += 1
		end
		return @jury_votes
	end

	def report_votes(final_votes)
		final_votes.each {|finalist, vote_count| puts "#{finalist.name.yellow}: #{vote_count}"}
	end

	def announce_winner(final_votes)
		winner = ["null", 0]
		final_votes.each do |finalist, vote_count|
			if vote_count > winner[1]
				winner[0] = finalist
				winner[1] = vote_count
			end
		end
		puts "The tribe has spoken: #{winner[0].name} has won Survivr!".light_blue
		return winner[0]
	end

end