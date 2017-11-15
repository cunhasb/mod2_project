class Label < ApplicationRecord
  has_many :profile_labels
  has_many :profiles, through: :profile_labels
end
