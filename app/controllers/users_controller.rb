class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end


  def edit

  end
  # def new
  #   @user = User.new
  #   @user.build_profile
  #   @user.build_destination

  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   redirect_to users_path(@user)
  # end
  
  # private

  # def user_params
  #   params.require(:user).permit(:nickmame,
  #     profile_attributes:[:id,:family_name,:first_name,:family_name_kana,:first_name_kana,:birth_date],
  #     destination_attributes:[:id, :destination_family_name,:destination_first_name,:destination_family_name_kana,:fdestination_first_name_kana,:post_code,:pref,:city,:house_number,:building_name,:phone_number]).merge(user_id: current_user.id)
  # end
end
