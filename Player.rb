require 'rainbow'
class Player 
   attr_accessor :name, :points, :speed
    def initialize(name)
        @name = name
        @points = 0
        @speed = 0
    end
    def win(points = 1)
        @points += points
        puts Rainbow('Correct').lightgreen
        #puts Rainbow('take a shot').lightgreen
    end
    def lose
        puts Rainbow('Incorrect').darkred
        #puts Rainbow ('take 2 shots').darkred
    end
end

