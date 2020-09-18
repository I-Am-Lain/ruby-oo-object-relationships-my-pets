require_relative "dog.rb"
require_relative "cat.rb"

class Owner
  
  attr_reader :name
  attr_reader :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  ###########    Begin Associations    ##############

  def cats
    Cat.all.select do |kitty|
      kitty.owner == self
    end
  end

  def dogs
    Dog.all.select do |doggy|
      doggy.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |doggy|
      doggy.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |kitty|
      kitty.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.select do |d|
      d.mood = "nervous"
      d.owner = nil
    end

    Cat.all.select do |c|
      c.mood = "nervous"
      c.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end