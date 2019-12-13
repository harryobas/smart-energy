class Device < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :location, presence: true
  validates :current_consumption, presence: true
end
