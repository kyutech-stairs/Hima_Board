class PostsController < ApplicationController
  def index
    @posts = Post.all.order(limit: :desc)
  end
  def show
     @post = Post.find_by(id: params[:id]) 
  end
  def new
    @post = Post.new
  end
  def create
    
    @post = Post.new(name: params[:name],limit: params[:limit],purpose: params[:purpose])
    
    if @post.save
      flash[:notice]="投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
    
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
    
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
    
  end
  
  def destroy
    
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to("/posts/index")
  end
  
end
