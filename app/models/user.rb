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
    self.likees << other_user
  end

  def unlike(other_user)
   self.likees.find(other_user_id).destroy
  end

  def log_in
  end
  def add_preference(image_path="http://www.exmooradventures.co.uk/wp-content/uploads/2013/01/DSCN59891.jpg",elements=20)
    pref= Concepts.new(Param.first.app_key,image_path)
    pref.labels[0...elements].each{|label|self.preference.labels << Label.create(name: label)}
  end

  def add_profile(image_path="https://www.gannett-cdn.com/-mm-/9ca0093dea60cacd58a897ab56282e0c75635558/c=172-0-2828-1997&r=x513&c=680x510/local/-/media/2017/07/28/USATODAY/USATODAY/636368386172605527-AFP-AFP-QE0OJ.jpg")
    demo= Demographics.new(Param.first.app_key,image_path)
    demo.demographics.keys.each{|x|self.profile.labels << Label.create(name: demo.demographics[x]["concepts"].first["name"])}
  end

  def preference_labels_with_names
    self.preference.labels.map{|label|label.name}
  end

  def profile_labels_with_names
    self.profile.labels.map{|label|label.name}
  end
end

# has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
# has_many :followers, through: :follower_relationships, source: :follower
#
# has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
# has_many :following, through: :following_relationships, source: :following
