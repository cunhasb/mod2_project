class Label < ApplicationRecord
  has_many :user_labels
  has_many :users, through: :user_labels

  has_many :preferences
  has_many :users, through: :preferences
end
