# frozen_string_literal: true

class Comic < ApplicationRecord
  has_many :comic_authors, dependent: :destroy
  has_many :authors, through: :comic_authors

  validates :title, presence: true, length: (1..100)
  validates :type, inclusion: { in: Enum::ComicType.values }

  bind_inum :type, Enum::ComicType

  self.inheritance_column = :_type_disabled
end
