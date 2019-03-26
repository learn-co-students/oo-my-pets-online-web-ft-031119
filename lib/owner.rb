class Owner
  @@all = []
  attr_accessor :name, :pets 
  attr_reader :species 
  
  def initialize(name)
    @name = name 
    @species = "human"
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
    @@all << self   
  end
    
  def self.all
    @@all 
  end 
  
  def self.count
    @@all.count 
  end
  
  def self.reset_all 
    @@all.clear 
  end
  
  def say_species
    "I am a #{species}."
  end 
  
  def buy_fish(fish)
    fish = Fish.new(fish)
    @pets[:fishes] << fish
  end
  
  def buy_cat(cat)
    cat = Cat.new(cat)
    @pets[:cats] << cat
  end
  
  def buy_dog(dog)
    dog = Dog.new(dog)
    @pets[:dogs] << dog
  end
  
  def walk_dogs
    @pets[:dogs].each {|d| d.mood = "happy"}
  end 
  
  def play_with_cats
    @pets[:cats].each {|c| c.mood = "happy"}
  end
  
  def feed_fish
    @pets[:fishes].each {|f| f.mood = "happy"}
  end
  
  def sell_pets
    @pets.each do |type, pets|
      pets.each do |p|
        p.mood = "nervous"
      end
    end
    self.pets.clear 
  end
  
  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
  
  # code goes here
end