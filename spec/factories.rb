FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username(specifier: 8) }
    phone_number { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password(min_length: 8, mix_case: true, special_characters: true) }
  end

  factory :vehicle do
    city { Faker::name }
    model { Faker::Vehicle.make }
    price { Faker::Number.number(digits: 10) }
    assembly_type { 'local' }
    engine_capacity { Faker::Vehicle.engine }
    engine_type { Faker::Vehicle.fuel_type }
    milage { Faker::Vehicle.mileage }
    transmission { 'manual' }
    currency { Faker::Currency.code }
    color { Faker::Vehicle.color }
    primary_contact { Faker::PhoneNumber.phone_number }
  end
end
