class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]
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
    @lat = request.location.latitude
    @lon = request.location.longitude
    @posts = Post.near(request.remote_ip.to_s, 20, order: :upvote_number)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.where(post_id: @post.id)
  end

  def view_comm
    @unread_comm = Unreadcomment.find(params[:id])    
    @post_id = Comment.find(@unread_comm.comment_id).post_id
    Readcomment.create(:user_id => @unread_comm.user_id, :comment_id => @unread_comm.comment_id, :to_post => @unread_comm.to_post, :reply_toid => @unread_comm.reply_toid)
    Unreadcomment.delete(params[:id])
    get_unread
    redirect_to "/posts/" + @post_id.to_s
  end

  # Get /search
  def search
    @posts = Post.search(params[:search])
    @keyword = params[:search]
  end

  def showall
    @posts = Post.all.order('created_at DESC')
  end

  def hot
    @posts = Post.all.order('upvote_number DESC')
  end

  def allUnreadComments
    @all_unread = Unreadcomment.where(user_id: current_user.id)
  end

  def allReadComments
    @all_read = Readcomment.where(user_id: current_user.id)
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
    @d_vote = Vote.find_by(post_id: @post.id, user_id: current_user.id, label: false)
    if @d_vote.nil?
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
    end
    respond_to do |format|
      format.js {render 'edit.js.erb'}
    end
  end

  def downvote 
    @post = Post.find(params[:id])
    @u_vote = Vote.find_by(post_id: @post.id, user_id: current_user.id, label: true)
    if @u_vote.nil?
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
    end
    respond_to do |format|
      format.js {render 'edit.js.erb'}
    end
  end

  def favorite
    @post = Post.find(params[:id])
    if current_user.favorites.exists?(:id => params[:id])
        current_user.favorites.delete(@post)
    else
        current_user.favorites << @post
    end
    respond_to do |format|
      format.js { render 'edit.js.erb' }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    post_params[:user_id] = current_user.id
    @post = Post.new(post_params)
    @post.ip_address = request.remote_ip

    respond_to do |format|
      if @post.save
        if params[:images]
            params[:images].each { |image|
                @post.pictures.create(image: image)
            }
        end
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
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
          if params[:images]
              params[:images].each { |image|
              @post.pictures.create(image: image)
          }
          end
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
       
        @unread_to_post = Unreadcomment.where(to_post: true, reply_toid: @post.id)
        @unread_to_post.each do |utp|
          Unreadcomment.delete(utp.id)
        end
        @unread_to_comm = Unreadcomment.where(to_post: false, user_id: current_user.id)
        @unread_to_comm.each do |utc|
          if Comment.find(utc.comment_id).post_id == @post.id
            Unreadcomment.delete(utc.id)
          end
        end
        @read_to_post = Readcomment.where(to_post: true, reply_toid: @post.id)
        @read_to_post.each do |rtp|
          Readcomment.delete(rtp.id)
        end
        @read_to_comm = Readcomment.where(to_post: false)
        @read_to_comm.each do |rtc|
          if Comment.find(rtc.comment_id).post_id == @post.id
            Readcomment.delete(rtc.id)
          end
        end
        
        @post.comments.destroy
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
                                   :pictures, :image, :tag_list, :ip_address, :address).merge(user_id: current_user.id)
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
