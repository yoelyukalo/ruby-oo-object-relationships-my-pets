class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def name
    @name
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

  def cats
    Cat.all.select {|own| own.owner == self}
  end

  def dogs
    Dog.all.select {|own| own.owner == self}
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end


  def walk_dogs
    Dog.all.select{|mood| mood.mood = "happy"}
  end

  def feed_cats
    Cat.all.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats 

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil 
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end