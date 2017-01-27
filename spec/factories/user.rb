require 'faker'

FactoryGirl.define do
  factory :user do
  	user_name							{ Faker::Hipster.word }
    first_name            { Faker::Name.last_name }
    last_name             { Faker::Name.first_name }
    email                 { Faker::Internet.email }
    password              '12345678'
    password_confirmation '12345678'
  end
end