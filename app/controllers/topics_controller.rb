class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    @topic = Topic.new
    @comments = Comment.new

    # @likes = Favorite.find_by(topic_id: params[:topic_id])
    # @user.user_id = @likes.id
    # @likes_count = Favorite.where(topic_id: @likes.id).count
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
