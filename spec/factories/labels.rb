FactoryBot.define do
  factory :label do
    name { "会議" }
  end
  factory :second_label, class: Label do
    name {'短期'}
  end
end
