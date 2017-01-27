require 'faker'

FactoryGirl.define do
  factory :post do
  	title						{ Faker::Name.title  }
    body            { Faker::ChuckNorris.fact }
    user            factory: :user
  end
end