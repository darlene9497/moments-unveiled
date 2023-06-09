class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

    def index
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render json: @comments
    end
  
    def show
      render json: @comment
    end
  
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @comment.destroy
      head :no_content
    end
  
    private
  
    def set_comment
      @comment = Comment.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end