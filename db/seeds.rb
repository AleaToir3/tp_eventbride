require 'faker'

User.destroy_all
Event.destroy_all

# créer 50 users
50.times do 
User.create(
    email:Faker::Internet.email(domain: 'yopmail.com'),
    encrypted_password:Faker::Internet.password,
    description:Faker::ChuckNorris.fact,
    first_name:Faker::Name.first_name, 
    last_name:Faker::Name.last_name)
end 

# créer 15 events
15.times do
    Event.create(
     start_date:Faker::Date.between(from: '2021-01-01',to: '2021-12-31'), 
     duration:rand(1..600),
     title:Faker::FunnyName.two_word_name, 
     description:Faker::GreekPhilosophers.quote, 
     price:rand(1..1000),
     location:Faker::Nation.capital_city)
end


