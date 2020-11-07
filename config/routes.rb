Rails.application.routes.draw do
  resources :animals

  get 'animals/search', to: 'animals/#search'
  get 'animalType/random', to: 'animals#random'
end
