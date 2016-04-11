#!/usr/bin/env ruby
require 'sinatra'
require 'ckan'
require 'map_h'

CKAN::API.api_url = 'http://leedsdatamill.org/api/1/'

get '/' do
  @script = File.read 'example.rb'
  @result = with_captured_stdout { eval @script }
  haml :index
end

def with_captured_stdout
  begin
    old_stdout = $stdout
    $stdout = StringIO.new('','w')
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end
