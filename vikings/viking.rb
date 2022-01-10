class Viking

  attr_accessor :name, :age, :health, :strength

  def initialize(name, health, age,  strength)
    @name = name
    @age = age
    @health = health
    @strength = strength
  end

  def self.create_warrior(name)
    age = rand * 20 + 15   
    health = [age * 5, 120].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
  end

  def attack(enemy)
    enemy.take_damage(10)
  end

  def shout(str)
    puts str
  end

  def sleep
    self.health += 1 unless health >= 100
  end

  protected
  def take_damage(damage)
    self.health -= damage
    self.shout ("Ouch!")
  end

end

oleg = Viking.create_warrior("Oleg")
lars = Viking.create_warrior("Lars")

puts oleg.health
8.times {lars.attack(oleg)}
puts oleg.health
