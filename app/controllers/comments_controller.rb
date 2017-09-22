class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :get_micropost, only: [:create]
  before_action :check_follow, only: [:create]

  def edit
    
  end

  def update
    if @comment.update_attributes comment_params
      respond_to do |format|
        flash[:success] = "success update"
        format.html{redirect_to @comment.micropost}
        format.js
      end
    else
      flash[:danger] = "cannot update"
      redirect_to @comment.micropost
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.micropost = Micropost.find(params[:micropost_id])
    if @comment.save
      flash[:success] = t "comment.comment_created"
      @micropost = Micropost.find(params[:micropost_id])
      redirect_to micropost_path(@micropost)
    else
      @comments = @micropost.comments.includes(:user)
      render "micropost/show"
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        flash[:success] = "comment has been destroyed"
        format.html{redirect_to @comment.micropost}
        format.js
      end
    else
      flash[:danger] = "cannot delete"
      redirect_to @commnet.micropost
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :micropost_id)
  end

  def correct_uset
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

  def get_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def check_follow
    if current_user != @micropost.user
      following_ids = current_user.active_relationships.pluck(:followed_id)
      if !following_ids.include? @micropost.user.id
        flash[:danger] = t "comment.follow_to_comment"
        redirect_back fallback_location: micropost_path(@micropost)
      end      
    end
  end
end
