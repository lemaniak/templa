class TeamsController < ApplicationController

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
    response = {message:"record not found"};
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end

  def index
    render json: Team.all
  end

  def create
    @team = Team.new(teams_param)
    if @team.save
      render json: @team
    else
      render json: @team.errors
    end
  end

  def show
    render json:Team.find(params[:id])
  end

  def update
    @team=Team.find(params[:id])
    if @team.update(teams_param)
      render json:@team.update(teams_param)
    else
      render json:@team.errors
    end

  end

  def destroy
    @team=Team.find(params[:id])
    @team.destroy
    render json: nil, status: :ok
  end

  private
  def teams_param
    params.require(:team).permit(:name,:picture,:creation_date);
  end
end
