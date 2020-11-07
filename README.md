# Animal Shelter API Application 

This is an API for a local animal shelter. The API will list the available animals (cat breeds) at the shelter.

The entire application is contained within the `app.rb` file.

## Install
    Clone  https://github.com/oswen138/animal_shelter_api.git
    bundle install
    rake db:create
    rake db:migrate
    rake db:seed

## Run the app
    enter rails s in terminal
    go to localhost:3000   (refer to endpoints below)
    Test API calls via postman

### Request : Show an individual cat by :id
`GET http://localhost:3000/animals/:id`
### Response

    {
        "id": 1,
        "name": "Lily",
        "age": "2",
        "breed": "Abyssinian"
    },
    {
        "id": 2,
        "name": "Poppy",
        "age": "14",
        "breed": "Turkish Angora"
    },

### Request : Post a new cat You can add name, age, and breed by clicking on "Body" in Postman just below the URL and passing in key-value pairs.

`POST http://localhost:3000/animals`
### Example initial response before passing in information

    
    {
    "id": 21,
    "name": null,
    "age": null,
    "breed": null
    }

### Example resulting response after passing in information

    
    {
    "id": 28,
    "name": "lily",
    "age": "7",
    "breed": "dinosaur "
    }


### Request : Update a cat. Just as with the POST call, you'll pass in the parameters you want to update in the body by using key-value pairs. Replace :id in the url with desired number. 

`PUT http://localhost:3000/animals/1`  

    {
    "message": "This animal has been updated successfully."
    }

### Request : Delete a cat with the corresponding :id.

`DELETE http://localhost:3000/animals/1`  

   
    {
    "message": "Animal deleted"
    }

### Request : Search a cat with the corresponding :id or name.

`GET http://localhost:3000/animals/?search={name}`  

Example call and response: 'GET http://localhost:3000/animals/?search=poppy'

   
    {
        "id": 2,
        "name": "Poppy",
        "age": "14",
        "breed": "Turkish Angora"
    },



## Notes
* Throttle call attempts for this API is limited to 3 reqs/2 minutes by default. 
You can customize the limit and period or completely deactivate by commenting/deleting the following code block.
## 

    
    #animal-shelter-API/config/initializers/rack_attack.rb (for rails app)
    ...  
      Rack::Attack.throttle("requests by ip", limit: 3, period: 2) do |request|
      request.ip
    end
    ...
  * Throttle call attempts for this API is limited to 3 reqs/2 minutes by default. 
You can customize the limit and period or completely deactivate by commenting/deleting the following code block.
## 

    
    #animal-shelter-API/app/controllers/animals_controller.rb 
    ...
    @animals = Animal.paginate(page: params[:page], :per_page => 10)
    ...

## Known Bugs
* API shows cat breeds only at this time.

## Technologies Used
* Ruby
  * Gems: Pry, RSpec, will_paginate, rake_attack, factory_bot
* Rails

## Support and contact details
_Email no one with any questions, comments, or concerns._

### License

*{This software is licensed under the MIT license}*

Copyright (c) 2020 **_Ophelia Swen_**
Epicodus Building an API Independent Project