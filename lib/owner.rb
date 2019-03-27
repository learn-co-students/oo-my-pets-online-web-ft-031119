class Owner
  # code goes here
  attr_accessor :name, :pets, :dog, :fish, :cat
  attr_reader :species

  @@all =[]
  @@count = 0


  def initialize(species)
    @species = species
    @@all << self
    @@count += 1
    @pets = Hash[:cats => [], :dogs => [], :fishes =>[]]
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
    @@all.clear
  end

  def say_species
    return "I am a #{@species}."
  end

  def pets
    @pets
  end

  def buy_fish(fish)
    @pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |a, b|
      b.map { |e| e.mood  = 'nervous' }
      b.clear
    end
  end


  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end
end
