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
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.limit = params[:limit]
    @post.purpose = params[:purpose]
    @post.save
    
    
    redirect_to("/posts/index")
  end
  
  def destroy
    
    @post = Post.find_by(id: params[:id])
    @post.destroy
    
    redirect_to("/posts/index")
  end
  
end
