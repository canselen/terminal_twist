require_relative 'player'
require_relative 'game'
require_relative 'docs'

#starts game 
Docs.print_to_screen
game = Game.new
game.play
game.winner


    


