#!/usr/bin/ruby -w          shebang comment
class Animal
  def set_noise(noise)
   @noise = noise
  end

  def get_noise
    @noise
  end
end

animal1 = Animal.new
animal1.set_noise("Moo!")
puts animal1.get_noise

animal2 = Animal.new
animal2.set_noise("Quack!")
puts animal2.get_noise
