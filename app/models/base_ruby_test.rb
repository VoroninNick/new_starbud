class Animal
  attr_accessor :name
  attr_accessor :age

  def initialize(name = nil)
    self.name = name
  end

  def go
    "Animal#go"
  end
end



class Dog < Animal
  def go
    "Dog#go"
  end
end

class Cat < Animal
  def go
    "Cat#go"
  end
end

def Dog animal
  Dog.new(animal)
end

a = Animal.new
a = Dog(a)