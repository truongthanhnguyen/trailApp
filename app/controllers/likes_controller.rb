class LikesController < ApplicationController
  before_action :get_micropost

  def create
    # binding.pry
    current_user.likes.create micropost: @micropost
    respond_to do |format|
      format.js
    end
  end

  def destroy
    # binding.pry
    @like = Like.find(params[:id])
    @micropost = @like.micropost
    @like.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def get_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  # def get_like
  #   @like = Like.find params[:like_id]
  # end
end
