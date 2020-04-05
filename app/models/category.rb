class Category < ApplicationRecord
  has_many :tasks

  validates :name, length: { in: 1..15 }
end
