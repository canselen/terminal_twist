require 'rainbow'
require 'artii'

class Docs
  def self.print_to_screen
    artii = Artii::Base.new
    puts artii.asciify('Welcome !')
puts 'RICK & MORTY TERMINAL'
puts 'How the game works:'
puts '1. Any amount of players can play'
puts '2. Each player will have 5 rounds'
puts '3. Points are given to correctly answered questions' 
puts '4. Game will announce winner at end (speed is also factored with points)'
  end
end
