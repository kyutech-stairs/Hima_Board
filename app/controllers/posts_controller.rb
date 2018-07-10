class PostsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  
  def index
    
    if logged_in?
      @posts  = current_user.posts.build
      @posts = Post.all.order(limit: :desc)
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  def show
     @post = Post.find_by(id: params[:id]) 
  end
  def new
    @post = Post.new
  end
  def create
    
    @post = current_user.posts.build(post_params)
    
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
  
  private

    def post_params
      params.require(:post).permit(:limit, :purpose)
    end
  
end
