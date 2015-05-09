class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def listUserPost
    @posts = Post.where(user_id: params[:id])
  end

  def listOwnPost
    @posts = Post.where(user_id: current_user.id)
    respond_to do |format|
      format.html {render :listUserPost}
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    @temp = request.remote_ip
    @posts = Post.all
      #Post.near("Westwood, Los Angeles, California, United States", 20, order: :distance)
      #Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.where(post_id: @post.id)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end
  def upvote
    @post = Post.find(params[:id]) 

      @vote = Vote.find_by(post_id: @post.id, user_id: current_user.id, label: true)
      if @vote.nil? 
        @post.upvote_number += 1 
        @post.save
        @new_vote = Vote.new(post_id: @post.id, user_id: current_user.id, label: true)
        @new_vote.save
      else
        @post.upvote_number -= 1
        @post.save
        Vote.destroy(@vote.id)
      end

    respond_to do |format|
      format.html { render :edit }
      format.js {render 'edit.js.erb'}
    end
  end

  def downvote 
    @post = Post.find(params[:id])
    @vote = Vote.find_by(post_id: @post.id, user_id: current_user.id, label: false)
      if @vote.nil? 
        @post.downvote_number += 1 
        @post.save
        @new_vote = Vote.new(post_id: @post.id, user_id: current_user.id, label: false)
        @new_vote.save

      else
        @post.downvote_number -= 1
        @post.save
        Vote.destroy(@vote.id)
      end
    respond_to do |format|
      format.html { render :edit }
      format.js {render 'edit.js.erb'}
    end
  end
  # POST /posts
  # POST /posts.json
  def create
    post_params[:user_id] = current_user.id
    post_params[:ipaddress] = request.ip
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
      respond_to do |format|
        @post.destroy
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :datetime, :content,
                                   :image_url, :downvote_number, :upvote_number,
                                   :post_image, :tag_list).merge(user_id: current_user.id)
    end

    def correct_user
      if @post.user_id != current_user.id
        respond_to do |format|
          format.html {redirect_to posts_url, notice: "No authority!"}
            format.json {head :no_content}
        end
      end
    end
end
