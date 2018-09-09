require './environment'

require_relative "./app/models/pirate"
require_relative "./app/models/ship"

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here

    get '/' do
      erb :root
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship|
        puts ship.inspect
        Ship.new(ship)
      end
      @ships = Ship.all

      erb :pirates
    end
end
end
