class PostsController < ApplicationController
  def index
    @posts = Post.all.order(limit: :desc)
  end
  def show
     @post = Post.find_by(id: params[:id]) 
  end
  def new
  end
  def create
    
    @post = Post.new(name: params[:name],limit: params[:limit],purpose: params[:purpose])
    
    @post.save
    
    redirect_to("/posts/index")
    
  end
end
