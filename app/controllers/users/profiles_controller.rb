class Users::ProfilesController < ApplicationController
	before_action :set_user, only: [:showCurrentUserProfile, :editProfile, :updateProfile]
	before_filter :authenticate_user!

	def showCurrentUserProfile
		@postCount = Post.where(user_id: @user.id).count
		respond_to do |format|
			format.html {render "users/profiles/profile"}
		end
	end

	def showOtherUserProfile
		@user = User.find(params[:id])
		@id = params[:id].to_s
		@postCount = Post.where(user_id: @user.id).count
		respond_to do |format|
			format.html {render "users/profiles/profile_other"}
		end
	end

	def editProfile
		@user = User.find(current_user)
		respond_to do |format|
			format.html {render "users/profiles/edit_profile"}
		end
	end

	def updateProfile
		if post_params[:gender] != nil
			if post_params[:gender] == 'Male'
				post_params[:gender] = true
			else
				post_params[:gender] = false
			end
		end
	
		respond_to do |format|
			if @user.update(post_params)
				format.html { redirect_to users_profile_path, notice: 'Profile was successfully updated.' }
			else
				format.html {render :editProfile, notice: 'Profile was not successfully updated.'}
			end
		end
	end


	private

	def post_params
      	params.require(:user).permit(:gender, :user_name, :avatar, :birthday, :location)
    end

    def set_user
    	@user = User.find(current_user)
    end

end
