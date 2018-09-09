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
      erb ':pirates/new'
    end

    post '/show' do
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship|
        Ship.new(ship)
      end
      @ships = Ship.all

      erb ':pirates/show'
    end
end
