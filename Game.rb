require 'faker'
require_relative 'player'

class Game
    def initialize
        @players = []
        puts "How many players are playing?"
        num_players = STDIN.gets.chomp.to_i
        (num_players).times do |number| 
            addPlayer(number + 1)
        end
    end
    def addPlayer(number)
        puts "Enter player #{number} name:"
        name = STDIN.gets.chomp
        player = Player.new(name)
        @players << player
    end
    def question_reverse(player)
        #reverse
        answer1 = Faker::RickAndMorty.character.downcase
        answer2 = answer1.reverse
        puts "write #{answer1} backwards "
        if STDIN.gets.chomp == answer2
            player.win
        elsif player.lose
        end
    end
    def question_length(player)
        #length
        answer1 = Faker::RickAndMorty.character
        answer2 = answer1.length
        puts "how many chars in #{answer1} (including spaces)?"
        if STDIN.gets.chomp.to_i == answer2
            player.win
        elsif player.lose
        end
    end
    def question_count(player)
        #count vowels
        answer1 = Faker::RickAndMorty.character
        puts "how many vowels in #{answer1}?"
        answer2 = answer1.scan(/[AaEeOoUuIi]/).count
        if STDIN.gets.chomp.to_i == answer2
            player.win
        elsif player.lose
        end
    end
# # putting methods in array, and call them randomly
@@methods = %i[question_count question_length question_reverse]
    def play
        @players.each do |player|
            puts "Your turn #{player.name}"
            puts "play is running"
            start_time = Time.now
            5.times {send @@methods.sample, player}
            end_time = Time.now
            player.speed = (end_time - start_time)
            puts "Thanks for playing #{player.name}"
            puts "Your total points: #{player.points}"
            puts "It took you #{player.speed.round} seconds"
        end
    end
    def winner
        @players.sort_by! do |player|
            [-player.points, player.speed]
        end
        winning_player = @players[0]
        puts "#{winning_player.name} won with #{winning_player.points} points at a speed of #{winning_player.speed.round} seconds!"
    end
end

