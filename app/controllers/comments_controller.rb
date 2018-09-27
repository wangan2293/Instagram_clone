class CommentsController < ApplicationController
  def index
    @topics = current_user.topics
    @comments = Comment.all
  end

  def create

    @comments = Comment.new(topic_id: params[:comment][:topic_id], body: params[:comment][:body])
    #binding.pry
     if @comments.body.empty?
      redirect_to topics_path, danger: 'コメントが空です'
    else
      if @comments.save
       redirect_to comments_index_path, success: '投稿に成功しました'
      else
       redirect_to topics_path, danger: '投稿に失敗しました'
      end
    end
  end
end
