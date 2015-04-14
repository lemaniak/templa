class PlayersController < APIController

  before_action :set_player, only: [:show,:update,:destroy]

  def index
    render json: Player.all
  end

  def create
    @player = Player.new(player_param)
    if @player.save
      render json: @player
    else
      render json: @player.errors
      # TODO test sending the player alone and see if it goes with errors ans ember detects this
    end
  end


  def show
    render json:@player
  end

  def update
    if @player.update(player_param)
      render json:@player
    else
      render json:@player.errors
    end

  end

  def destroy
    @player.destroy
    render json: nil, status: :ok
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_param
    params.require(:player).permit(:name,:age,:lastname,:salary,:birthdate,:position,:status,:team_id);
  end
end
