FactoryBot.define do
  factory(:animal) do
    name {Faker::Creature::Cat.name}
    age {Faker::Number.within(range: 1..15)}
    breed {Faker::Creature::Cat.breed}
  end
end