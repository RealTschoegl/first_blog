class PostsController < ApplicationController
  def index
    @name = "Shehzan"
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post}
      else
        format.html { render action: "new"}
      end
    end
  end 

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.where(:id => params[:id]).first

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @post = Post.where(id: params[:id]).first
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Product was successfully deleted." }
        format.json { head :no_content }
      end
  end



end
