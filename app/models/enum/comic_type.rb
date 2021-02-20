# frozen_string_literal: true

module Enum
  class ComicType < Inum::Base
    define :ACTION, 0
    define :FANTASY, 1
    define :SCHOOL, 2
  end
end
