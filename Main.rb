require_relative 'player'
require_relative 'game'
require_relative 'docs'

args = ARGV
if args.include?("--help")
    Docs.print_to_screen
end

game = Game.new
game.play
game.winner


    


