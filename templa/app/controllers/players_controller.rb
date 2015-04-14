class PlayersController < ApplicationController

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    response = {message:"parameter "+ parameter_missing_exception.to_s}
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end

  rescue_from(ActionController::UnpermittedParameters) do |non_permited_parameter_exception|
    response = {message:non_permited_parameter_exception.to_s}
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    response = {message:"player not found"};
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end


  def index
    render json: Player.all
  end

  def create
    @player = Player.new(player_param)
    if @player.save
      render json: @player
    else
      render json: @player.errors
    end
  end

  def show
    render json:Player.find(params[:id])
  end

  def update
    @player=Player.find(params[:id])
    if @player.update(player_param)
      render json:@player
    else
      render json:@player.errors
    end

  end

  def destroy
    @player=Player.find(params[:id])
    @player.destroy
    render json: nil, status: :ok
  end

  private
  def player_param
    params.require(:player).permit(:name,:age,:lastname,:salary,:birthdate,:position,:status,:team_id);
  end
end
