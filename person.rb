class Person

  attr_reader :name

  def initialize(name)
    @name = name
  end

  # Getter method for name
 # def name
   # @name
  #end

end

p = Person.new('L. Ron')
puts p.name