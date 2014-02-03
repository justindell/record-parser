require 'sinatra'
require 'grape'
require './lib/server'

class API < Grape::API
  format :json

  SERVER = Server.new

  resource :records do
    params do
      requires :line, type: String, desc: 'Record input'
    end
    post do
      SERVER.add_record params[:line]
    end

    get :gender do
      SERVER.records_by_gender
    end

    get :birth_date do
      SERVER.records_by_birth_date
    end

    get :name do
      SERVER.records_by_last_name
    end
  end
end

run Rack::Cascade.new [API]
