require 'artii'

require 'faker'
require 'rainbow'
# using  Rainbow
#limegreen,gold
require_relative 'player'
class Game
    def initialize
        @players = []
        puts Rainbow("How many players are playing?").gold
        num_players = STDIN.gets.chomp.to_i
        (num_players).times do |number| 
            addPlayer(number + 1)
        end
    end
    def addPlayer(number)
         puts Rainbow("Enter player #{number} name:").darkgoldenrod

        name = STDIN.gets.chomp
        player = Player.new(name)
        @players << player
    end
    def question_reverse(player)
        #reverse
        answer1 = Faker::RickAndMorty.character.downcase
        answer2 = answer1.reverse
        puts Rainbow("write #{answer1} backwards ").crimson
        if STDIN.gets.chomp == answer2
            player.win
        elsif player.lose
        end
    end
    def question_length(player)
        #length
        answer1 = Faker::RickAndMorty.character
        answer2 = answer1.length
        puts Rainbow("how many chars in #{answer1} (including spaces)?").crimson
        if STDIN.gets.chomp.to_i == answer2
            player.win
        elsif player.lose
        end
    end
    def question_count(player)
        #count vowels
        answer1 = Faker::RickAndMorty.character
        puts r2 = answer1.length
        puts Rainbow("how many vowels in #{answer1}?").crimson
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
            puts Rainbow("Your turn").darkgoldenrod + Rainbow("  #{player.name}").deepskyblue
            puts Rainbow("play is running").darkgoldenrod
            start_time = Time.now
            5.times {send @@methods.sample, player}
            end_time = Time.now
            player.speed = (end_time - start_time)
            puts "Thanks for playing " + Rainbow("#{player.name}").deepskyblue
            puts "Your total points:" + Rainbow("#{player.points}").skyblue
            puts "It took you " + Rainbow("#{player.speed.round}").violet + " seconds"
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

