require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  attr_reader :playername

  enable :sessions

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  post '/newgame' do
    session[:playername] = params[:playername]
    redirect '/newgame' if session[:playername] == ""
    redirect '/game'
  end

  get '/game' do
    $game = Game.new Player, Board
    erb :game
  end

  post '/game' do
    @parameters = params
    $game.player_1.place_ship Ship.send(@parameters[:ship_type].to_sym), @parameters[:location].to_sym, @parameters[:direction].to_sym
    redirect '/gameplay' if $game.player_1.board.ships.count > 0
    erb :game
  end

  get '/gameplay' do
    place_opponent_ships
    erb :gameplay
  end

  post '/gameplay' do
    @fire_loc = params[:fire_loc]
    @player_1_result = $game.player_1.shoot(@fire_loc.to_sym)
    erb :gameplay
  end

  def place_opponent_ships
    # $game.player_2.place_ship Ship.battleship, :A1, :horizontally
    $game.player_2.place_ship Ship.submarine, :E1, :horizontally
    # $game.player_2.place_ship Ship.aircraft_carrier, :J1, :vertically
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
