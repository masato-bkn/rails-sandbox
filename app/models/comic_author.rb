class ComicAuthor < ApplicationRecord
    belongs_to :author
    belongs_to :comic
end
