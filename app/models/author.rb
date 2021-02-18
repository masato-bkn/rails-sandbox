# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :comic_authors, dependent: :destroy
  has_many :comics, through: :comic_author
end
