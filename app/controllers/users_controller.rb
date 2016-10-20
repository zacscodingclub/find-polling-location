class UsersController < ApplicationController
  def data
    @locations = PollingLocation.current_status
  end

  def index

  end

  def create
    if user_params[:gps_location] == "1"
      @lat_lng = cookies[:lat_lng].split("|")
      @user = User.new(latitude: @lat_lng[0], longitude: @lat_lng[1])
      @user.save
      cookies[:lat_lng] = ""

      redirect_to controller: 'users', action: 'results', uid: @user.id
    elsif !user_params[:input_location].empty?
      @user = User.new(current_location: user_params[:input_location] + ', Buncombe County, NC')
      @user.save

      if @user.latitude && @user.longitude
        redirect_to controller: 'users', action: 'results', uid: @user.id
      else
        flash[:danger] = "Sorry about that, but something went wrong. Please try again."
        render 'index'
      end
    else
      flash[:danger] = "Please enter an address or select the GPS option."
      render 'index'
    end
  end

  def results
    @user = User.find(params[:uid])
    PollingLocation.get_current_locations(@user)
    locations = PollingLocation.where(uid: @user.id)
    @near_locations = locations.near(@user)[0..4]
  end

  private
    def user_params
      params.require(:user).permit(:input_location, :gps_location)
    end
end
