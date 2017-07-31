class MyCar
    # new instance of object
    # year, color, model, speed = 0
    attr_accessor :color
    attr_reader :year

    def initialize(y, c, m)
        @year = y
        @color = c
        @model = m
        @speed = 0
    end

    def spray_paint(color)
        self.color = color
        puts "Your new #{color} paint job looks great!"
    end

    def speed_up(number)
        @speed += number
    end

    def brake(number)
        @speed -= number
    end

    def car_off
        @speed = 0
    end

    def current_speed
        puts "You are now going #{@speed} mph."
    end

end

porsche = MyCar.new(2017, 'white', '911')
porsche.current_speed
porsche.speed_up(100)
porsche.current_speed
porsche.brake(50)
porsche.current_speed
# porsche.color = 'green'
puts porsche.color
puts porsche.year
porsche.spray_paint('pink')