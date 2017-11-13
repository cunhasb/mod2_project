class RelationshipsController < ApplicationController

post ':user_name/like_user', to: 'relationships#like_user', as: :follow_user
post ':user_name/unlike_user', to: 'relationships#unlike_user', as: :unfollow_user

end
