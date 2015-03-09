require "sinatra"
require "pry"
require "sqlite3"
require "json"

DATABASE = SQLite3::Database.new("slides.db")
DATABASE.results_as_hash = true

require_relative "slide"

get "/" do
  erb :slideshow
end

post "/slides" do
  slides = Slide.all
  slide_hash = slides.map {|s| s.to_hash}
  slide_hash.to_json
end