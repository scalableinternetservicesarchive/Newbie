class Users::ProfilesController < ApplicationController
	before_action :set_user, only: [:showCurrentUserProfile, :editProfile, :updateProfile]
	before_filter :authenticate_user!
	def showCurrentUserProfile
		
		respond_to do |format|
			format.html {render "users/profiles/profile"}
		end
	end

	def showOtherUserProfile
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
      	params.require(:user).permit(:gender, :user_name)
    end

    def set_user
    	@user = User.find(current_user)
    end

end
