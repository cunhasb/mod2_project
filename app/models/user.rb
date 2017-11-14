class User < ApplicationRecord

  has_many :given_likes, foreign_key: :liker_id, class_name: "Like"
  has_many :likees, through: :given_likes

  has_many :received_likes, foreign_key: :likee_id, class_name: "Like"
  has_many :likers, through: :received_likes

  has_many :preferences
  has_many :user_labels
  has_many :labels, through: :user_labels
  has_many :labels, through: :preferences



  has_secure_password

  def add_like(other_user_id)

    other_user = User.find(other_user_id)
    self.likees << other_user
  end

  def unlike(other_user)
   self.likees.find(other_user_id).destroy
  end

  def log_in
  end
end

# has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
# has_many :followers, through: :follower_relationships, source: :follower
#
# has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
# has_many :following, through: :following_relationships, source: :following
