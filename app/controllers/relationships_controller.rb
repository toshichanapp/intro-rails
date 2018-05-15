class RelationshipsController < ApplicationController

  def create
    respond_to do |format|
      if logged_in?
        @user = User.find(params[:relationship][:followed_id])
        current_user.follow!(@user)
        format.js {render 'users/create'}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      @user = Relationship.find(params[:id]).followed
      current_user.unfollow!(@user)
      format.js {render 'users/destroy'}
    end
  end
end
