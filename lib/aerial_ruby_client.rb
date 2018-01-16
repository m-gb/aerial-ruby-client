#!/usr/bin/env ruby

require 'httparty'
require 'json'
require 'open-uri'

def download_aerials(foldername)
  aerialdir = File.join(Dir.home, foldername) 
  #=> /root/Aerial or C:/Users/root/Aerial depending on the platform.

  Dir.mkdir(aerialdir) unless Dir.exists?(aerialdir)

  url = 'http://a1.phobos.apple.com/us/r1000/000/Features/atv/' +
        'AutumnResources/videos/entries.json'

  response = HTTParty.get(url)
  parsed = JSON.parse(response)
  urls = []
  parsed.each do |item|
    item['assets'].each do |asset|
      urls << asset['url']
    end
  end

  urls.each do |url|
    filename = url.split('/').last
    filepath = File.join(aerialdir, filename)
    if File.exists?(filepath)
      puts "File #{filename} already exists, skipping..."
    else
      open(url) do |u|
        puts "Downloading #{url} to #{filepath}"
        File.open(filepath, 'wb') { |f| f.write(u.read) }
      end
    end
  end
  puts 'Finished processing all URLs!'
end
