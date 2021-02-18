# frozen_string_literal: true

FactoryBot.define do
  factory :comic do
    title { 'hoge-title' }
    authors { [create(:author)] } 
  end
end
