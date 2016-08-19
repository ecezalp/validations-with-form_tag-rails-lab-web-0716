class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    tester = Post.new(title: params[:title], content: params[:content], category: params[:category])
    if tester.valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      tester.id = @post.id
      @post = tester
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
