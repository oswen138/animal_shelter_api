class Animal < ApplicationRecord
  validates :name, :age, :breed, presence: true

  scope :search, -> (animal_name) { where('name ilike ?', "%#{animal_name}%")}

end