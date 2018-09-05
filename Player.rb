class Player 
   attr_accessor :name, :points, :speed
    def initialize(name)
        @name = name
        @points = 0
        @speed = 0
    end
    def win(points = 1)
        @points += points
        puts 'You won!'
    end
    def lose
        puts 'You lost!'
    end
end

