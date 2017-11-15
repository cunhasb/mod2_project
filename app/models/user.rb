class User < ApplicationRecord

  has_many :given_likes, foreign_key: :liker_id, class_name: "Like"
  has_many :likees, through: :given_likes
  mount_uploader :avatar, AvatarUploader

  has_many :received_likes, foreign_key: :likee_id, class_name: "Like"
  has_many :likers, through: :received_likes

  has_one :preference
  has_one :profile

  has_secure_password

  def add_like(other_user_id)
    other_user = User.find(other_user_id)
    if !self.likees.include?(other_user)
      self.likees << other_user
    end
  end

  def unlike(other_user_id)
   like = Like.find_by(liker_id: self.id, likee_id:other_user_id.to_i)
   like.destroy
  end

  def log_in
  end

  def add_demographics
    byebug
    demographics= Demographics.new(Param.first.app_key,self.avatar.path)
    self.age_appearance = demographics.age.first
    self.gender_appearance = demographics.gender.first
    self.multicultural_appearance = demographics.multicultural.first
  end
end

# has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
# has_many :followers, through: :follower_relationships, source: :follower
#
# has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
# has_many :following, through: :following_relationships, source: :following
