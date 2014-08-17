# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board_access do
    roles_mask 0
    board_id 0
    user_id 0
  end
end
