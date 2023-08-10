class Todo < ApplicationRecord
  validates :title ,presence: true, uniqueness: true
  validates :status, presence: true
end
