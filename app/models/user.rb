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

  def unlike(other_user_id)
   delete_me = Like.find_by(liker_id: self.id, likee_id: other_user_id)
   delete_me.destroy
  end

  def log_in
  end

  def add_preference(image_path="http://www.exmooradventures.co.uk/wp-content/uploads/2013/01/DSCN59891.jpg",elements=5)
    pref= Concepts.new(Param.first.app_key,image_path,"url")
    pref.labels[0...elements].each{|label|self.preference.labels << Label.create(name: label)}
  end

  def add_profile(image_path="https://www.gannett-cdn.com/-mm-/9ca0093dea60cacd58a897ab56282e0c75635558/c=172-0-2828-1997&r=x513&c=680x510/local/-/media/2017/07/28/USATODAY/USATODAY/636368386172605527-AFP-AFP-QE0OJ.jpg")
      demo= Demographics.new(Param.first.app_key,image_path,"byte")
      demo.demographics.keys.each do |x|
        label = Label.create(name: demo.demographics[x]["concepts"].first["name"])
        self.profile.labels << label
        if self.demo
        self.demo = self.demo << "," << label.name
        else
          self.demo = label.name
        end
      end
      self.save
      pref= Concepts.new(Param.first.app_key,image_path,"byte")
      pref.labels[0...5].each{|label|self.profile.labels << Label.create(name: label)}
    end

  def add_celebrity(image_path="https://www.gannett-cdn.com/-mm-/9ca0093dea60cacd58a897ab56282e0c75635558/c=172-0-2828-1997&r=x513&c=680x510/local/-/media/2017/07/28/USATODAY/USATODAY/636368386172605527-AFP-AFP-QE0OJ.jpg")
    demo= Demographics.new(Param.first.app_key,image_path,"url")
    demo.demographics.keys.each do |x|
      label = Label.create(name: demo.demographics[x]["concepts"].first["name"])
      self.preference.labels << label
      self.cel_demo ? self.cel_demo = self.cel_demo << "," << label.name : self.cel_demo = label.name
      end
      self.save

  end

  def preference_labels_with_names
    self.preference.labels.map{|label|label.name}
  end

  def profile_labels_with_names
    self.profile.labels.map{|label|label.name}
  end

#returns a sorted array of users objects with commonality scores
  def match
    User.all.each_with_object(matches= {}) do |user|
      if self != user && match_already_liked?(user) == false
        common = self.preference_labels_with_names & user.profile_labels_with_names
        matches[user]=common.count
      end
    end.sort_by { |user, score| score }.reverse
  end

#helper method that returns true if current user already likes a user
def match_already_liked?(other_user_id)
  self.likees.include?(other_user_id)
end


#removes commonality scores from array
def match_no_scores
  match.map{|user| user[0]}
end

#returns sorted array of users objects with commonality scores who were matched

def matches_only
  match ? filter(match.select{|user| user[1] > 0 },Param.first.filters) : matches = []
end

def matches_only_no_score
  matches_only ? filter(match.map{|user| user[0]},Param.first.filters) : matches = []
end

# runs filters on match list
# filters_array, contain filters to run in order
def filter(array,filters_array=[])
  matches=array
  if !!filters_array
    f_array=filters_array.split(",")
    f_array.each do |filter|
      case filter
      when "age"
        match_position = 0
      when "gender"
        match_position = 1
      when "multicultural"
        match_position = 2
      end
      matches = matches.select do |match|
        if match.class == Array
          self.cel_demo.split(",").include? match.first.demo.split(",")[match_position]
        else
          self.cel_demo.split(",").include? match.demo.split(",")[match_position]
        end
      end
    end
  end
  matches
end

end
# has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
# has_many :followers, through: :follower_relationships, source: :follower
#
# has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
# has_many :following, through: :following_relationships, source: :following
