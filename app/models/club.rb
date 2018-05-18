class Club < ApplicationRecord
  has_and_belongs_to_many :hashtags
  # has_and_belongs_to_many doesn't support dependent options!!!! ...
end
