APP_ROOT = File.dirname(__FILE__)
$:.unshift(File.join(APP_ROOT, 'lib') )
require 'reddit'

require "sinatra"
require "net/http"
require "uri"
require "json"



get "/" do
  @posts = Reddit.get_reddit
  erb :index
end
