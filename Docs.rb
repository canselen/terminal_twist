require 'rainbow'
require 'artii'

class Docs
  def self.print_to_screen
    artii = Artii::Base.new
    #puts artii.asciify('WELCOME')
puts 'Welcome to Terminal-twist'
puts 'Rules of the game:'
puts '1. Each player drinks after losing each challenge'
puts '2. Each player will have 5 rounds'
puts '3. After game is finished, random punishment is given to loser'
  end
end
