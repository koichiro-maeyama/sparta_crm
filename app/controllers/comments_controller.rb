class CommentsController < ApplicationController
  def new

  end
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to customer_url(@comment.customer_id)
  end
  def destroy
    @comment = Comment.find(params[:id])
    customer_id = @comment.customer_id
    @comment.destroy
    redirect_to customer_url(customer_id)
  end
  def show
    @comment = Comment.new
    @comments = Comment.where(customer_id: params[:id].to_i)
  end

  def comment_params
    # params.require(:key).permit(:filter)
    params.require(:comment).permit(
      :body,
      :customer_id
      )
  end

end
