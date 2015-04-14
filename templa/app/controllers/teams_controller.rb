class TeamsController  < APIController

  before_action :set_team, only: [:show,:update,:destroy]

  def index
    render json: Team.all
  end

  def create
    @team = Team.new(teams_param)
    if @team.save
      render json: @team
    else
      render json: @team.errors, status: :bad_request
    end
  end

  def show
    render json:@team
  end

  def update
    if @team.update(teams_param)
      render json:@team
    else
      render json:@team.errors
    end

  end

  def destroy
    @team.destroy
    render json: nil, status: :ok
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def teams_param
    params.require(:team).permit(:name,:picture,:creation_date);
  end
end
