class Preference < ApplicationRecord
  belongs_to :user
  has_many :preference_labels
  has_many :labels, through: :preference_labels
end
