require 'faker'
require_relative '../config/application'

10.times do
Task.create(name: Faker::Lorem.sentence, complete: rand(2))
end