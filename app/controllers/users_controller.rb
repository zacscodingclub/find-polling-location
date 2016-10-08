class UsersController < ApplicationController
  def create
    unless cookies[:lat_lng].empty?
      @lat_lng = cookies[:lat_lng].split("|")
      @user = User.new(latitude: @lat_lng[0], longitude: @lat_lng[1])
      @user.save
      cookies[:lat_lng] = ""

      redirect_to controller: 'users', action: 'results', uid: @user.id
    end

    if user_params[:input_location]
      @user = User.new(current_location: user_params[:input_location] + ', Buncombe County, NC')
      @user.save

      redirect_to controller: 'users', action: 'results', uid: @user.id
    else
      flash[:notice] = "Please enter an address or select the GPS option."
      render :back
    end
  end

  def results
    @user = User.find(params[:uid])
  end

  private
    def user_params
      params.require(:user).permit(:input_location, :gps_location)
    end
end
