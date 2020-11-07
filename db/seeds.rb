# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    20.times do |i|
      animal = Animal.create!(
        name:  Faker::Creature::Cat.name,
        age: Faker::Number.within(range: 1..15),
        breed: Faker::Creature::Cat.breed
      )
      puts "Animal #{i}: Name is #{animal.name}, age is #{animal.age}, breed is #{animal.breed}."
    end
  end
end
.
Seed.begin