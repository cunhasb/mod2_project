class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_labels
  has_many :labels, through: :profile_labels
end
