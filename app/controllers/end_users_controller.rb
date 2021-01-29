class EndUsersController < ApplicationController
  def show
    @end_user=EndUser.find(params[:id])
  end

  def edit
    @end_user=EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user.id)
  end

  def confirm
    @end_user=current_end_user
  end



  def destroy
  end


  private

  def end_user_params
    params.require(:end_user).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number)
  end


end
