class Item < ApplicationRecord
  # assosiations
  belongs_to :todo

  # validations
  validates_presence_of :name
end
