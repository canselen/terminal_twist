require 'artii'
require 'faker'
require 'rainbow'
require_relative 'player'

class Game
    def initialize
        @players = []
        puts Rainbow("How many players are playing?").green
        num_players = STDIN.gets.chomp.to_i
        (num_players).times do |number| 
            addPlayer(number + 1)
        # if num_players == 0
        #     return
        # end
        end
    end
    def addPlayer(number)
        puts Rainbow("Enter player #{number} name:").green
        name = STDIN.gets.chomp.capitalize
        player = Player.new(name)
        @players << player
    end
    def question_reverse(player)
        #reverse
        answer1 = Faker::RickAndMorty.character.downcase
        answer2 = answer1.reverse
        puts Rainbow("Write #{answer1} backwards").green
        if STDIN.gets.chomp == answer2
            player.win
        elsif player.lose
        end
    end
    def question_length(player)
        #length
        answer1 = Faker::RickAndMorty.character
        answer2 = answer1.length
        puts Rainbow("How many characters in #{answer1} (including spaces)?").green
        if STDIN.gets.chomp.to_i == answer2
            player.win
        elsif player.lose
        end
    end
    def question_count(player)
        #count vowels
        answer1 = Faker::RickAndMorty.character
        answer2 = answer1.length
        puts Rainbow("how many vowels in #{answer1}?").green
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
            puts Rainbow("Your turn").darkgoldenrod + Rainbow(" #{player.name}").deepskyblue
            puts Rainbow("Game on!").darkgoldenrod
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
        #if num_players > 1
        @players.sort_by! do |player|
            [-player.points, player.speed]
            #puts 'Winner chooses a fitting punishment for the group'
        #else num_players <= 
        end
        winning_player = @players[0]
        puts "#{winning_player.name} won with #{winning_player.points} points at a speed of #{winning_player.speed.round} seconds!"
    end
end

