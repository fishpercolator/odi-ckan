require 'sinatra'
require 'rack/webconsole'
require 'ckan'
require 'map_h'

class OdiApp < Sinatra::Application
  use Rack::Webconsole

  set :protection, :except => :frame_options
  
  CKAN::API.api_url = 'http://leedsdatamill.org/api/1/'
  
  get '/' do
    haml :console
  end
end
