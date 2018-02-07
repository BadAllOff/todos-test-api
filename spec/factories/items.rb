FactoryGirl.define do
  factory :item do
    # faker methods in a block, we ensure that faker generates
    # dynamic data every time the factory is invoked.
    # This way, we always have unique data.
    name { Faker::StarWars.character }
    done false
    todo_id nil
  end
end