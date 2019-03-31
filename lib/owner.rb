require "pry"

class Owner
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish)
    self.pets[:fishes] << Fish.new(fish).tap {|f| f.name}
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat).tap {|c| c.name}
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog).tap {|d| d.name}
  end

  def walk_dogs
    self.pets[:dogs].each {|dog|
      dog.mood = "happy"
    }
  end

  def play_with_cats
    self.pets[:cats].each {|cat|
      cat.mood = "happy"
    }
  end

  def feed_fish
    self.pets[:fishes].each {|fish|
      fish.mood = "happy"
    }
  end

  def sell_pets
    self.pets.each{ |type, pet|
      pet.each{|i| i.mood = "nervous"}
    }
    self.pets.clear
  end

  def list_pets
    

    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end