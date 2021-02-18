# frozen_string_literal: true

class Comic < ApplicationRecord
  has_many :comic_authors, dependent: :destroy
  has_many :authors, through: :comic_authors
end
