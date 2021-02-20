# frozen_string_literal: true

FactoryBot.define do
  factory :comic do
    title { 'hoge-title' }
    type { Enum::ComicType::ACTION }
    authors { [create(:author)] }
  end
end
