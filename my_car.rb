class MyCar
    # allows you to get and set color
    # using objectname.color = 'whatver'
    attr_accessor :color

    # allows you to only use get 
    # puts objectname.year displays info
    attr_reader :year

    # new instance of object     
    def initialize(y, c, m)
        @year = y
        @color = c
        @model = m
        @speed = 0
    end

    # add a class method that calculates the gas mileage of any car
    # can call method withou creating instance of object?
    def self.gas_mileage
        puts "#{miles / gallons} miles per gallon of gas"
    end

    # self. notation only works if it is an attr in the class
    def spray_paint(color)
        self.color = color

        # inside the method so no self.color needed
        puts "Your new #{color} paint job looks great!"
    end

    # not an attr so need to use @ notation
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

    def to_s
        puts "This is a #{@color} #{@model} made in #{@year}"
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
porsche.to_s

# Class Variables
# keeps track of number of times
# object is initialized
# @@number_of_cars = 0
# def initialize
#     @@number_of_cars += 1 
# end
# def self.total_number_of_cars
#     @@number_of_cars
# end
# puts MyCar.total_number_of_cars

# Constants
# DOG_YEARS = 7
# variable will never change

# to_s
# puts objectname is the same as puts objectname.to_s
# returns classname and meta id of object
# you can override the to_s method
#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# puts classname

# Inspect
# p objectname 
# Helpful fo debugging purposes

# MORE ABOUT SELF ##### ask about it in lecture!
# need to be an accessor attr
# within a class and within instance method
# self.weight= is the same as sparky.weight=
# 
# within a class and outside instance method
# def self.name=(n) is the same as def GoodDog.name=(n)

# Class Inheritance
# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
# end
#
# Overriding methods inherited from super class
# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(n)
#     self.name = n
#   end

#   def speak
#     "#{self.name} says arf!"
#   end
# end

# SUPER
# invokes method of the same name from super class
# must be inside method of object with the same name
# object must be a subclass of superclass
# class Animal
#   def speak
#     "Hello!"
#   end
# end
#
# class GoodDog < Animal
#   def speak
#     super + " from GoodDog class"
#   end
# end
#
# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# MODULES
# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable         # mixing in Swimmable module
# end
# sparky = Dog.new
# neemo  = Fish.new
# paws   = Cat.new

# sparky.swim                 # => I'm swimming!
# neemo.swim                  # => I'm swimming!
# paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>

# Inheritance vs Modules 
# Modules are used only for namespacing and grouping common methods together.
# If it's an "is-a" relationship, choose class inheritance. If it's a "has-a" relationship, choose modules

# Method Lookup Path
# puts classname.ancestors
# puts objectname.ancestors
# last module called is the first in ancestor chain

# More Modules
# Namespacing
# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end
# end
# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak('Arf!')           # => "Arf!"
# kitty.say_name('kitty')       # => "kitty"

# Container
# module Mammal
#   ...

#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end
# value = Mammal.some_out_of_place_method(4)

# private methods
# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# sparky.human_years

#protected methods
# class Animal
#   def a_public_method
#     "Will this work? " + self.a_protected_method
#   end

#   protected

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end

# fido = Animal.new
# fido.a_public_method        # => Will this work? Yes, I'm protected!