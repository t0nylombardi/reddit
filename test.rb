require "net/http"
require "uri"
require "json"

def get_reddit
  uri = URI.parse("http://www.reddit.com/r/rails/new/.json")

  response = Net::HTTP.get_response(uri)

  data = JSON.parse(response.body)
  posts= []
  data['data']['children'].each do |child|
     posts << child
  end
  posts
end
  


@posts = get_reddit

@posts.each do |post|
  puts "#{post["data"]['title']} : #{post["data"]['url']}"

end