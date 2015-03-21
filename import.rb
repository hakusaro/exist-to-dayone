#coding: utf-8
require 'rubygems'
require 'httparty'
require 'rb-dayone'
require 'json'

puts "Enter your Exist.io username: "
username = gets

puts "Enter your Exist.io password: "
password = gets

username.strip!
password.strip!

response = HTTParty.post("https://exist.io/api/1/auth/simple-token/", :body => {:username => username, :password => password})

unless response.code == 200
  puts "Invalid username or password!"
  abort
end

token = response['token']

response = HTTParty.get("https://exist.io/api/1/users/$self/attributes/mood/?limit=1000000&page=1", :headers => { "Authorization" => "Token #{token}"})

moods = JSON.parse(response.body)

unless response.code == 200
  puts "Something unexpectedly went wrong getting data from Exist.io! Aborting!"
  abort
end

puts "All systems go (#{moods['count']} raw moods ready). Press enter to start. BACK UP YOUR JOURNAL BEFORE CONTINUING."
gets

count = 0

moods['results'].each do |mood|
  if mood['value'] != nil
    date = Time.parse(mood['date'])
    val = mood['value']
    rating_stars = ""
    val.to_i.times do
      rating_stars += "★"
    end

    open_stars = 5 - val.to_i

    open_stars.times do
      rating_stars += "☆"
    end

    entry = DayOne::Entry.new("Today's #Mood\nRating: #{rating_stars}", :tags => ["Mood"], :creation_date => date)
    entry.create!
    count += 1
  end
end

puts "According to the Exist API, you have #{moods['count']} moods. You really have #{count} moods."