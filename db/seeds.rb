# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
250.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.org"
  type = TYPES.sample
  fax = Faker::PhoneNumber.phone_number
  phone = Faker::Base.numerify('#########')#Faker::PhoneNumber.phone_number
  location = LOCATIONS.sample
  website = Faker::Internet.url
  publish_email= EMAIL_VISIBILITY.sample
  keywords = "#{name}; #{location}"
  publish_to = PUBLISH_TO.sample
  ownership = OWNERSHIP.sample

  Service.create!(name:  name,
               email: email,
               type: type,
               fax: fax.to_s,
               phone: phone.to_s,
               location: location,
               website: website,
               publish_email:  publish_email,
               keywords: keywords,
               publish_to:  publish_to,
               ownership:  ownership)

end