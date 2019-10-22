require 'sinatra'

greetings = ["Hi", "Hello", "Servus"]

get '/' do
  "#{greetings.sample} #{params[:name]&.strip}"
end
