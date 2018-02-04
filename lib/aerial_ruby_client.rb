#!/usr/bin/env ruby

require 'aerial_ruby_client/version'

require 'httparty'
require 'json'
require 'open-uri'
require 'fileutils'

module AerialRubyClient
  def download_aerials(foldername)
    aerialdir = File.join(Dir.home, foldername)
    #=> /home/username/foldername
  
    Dir.mkdir(aerialdir) unless Dir.exists?(aerialdir)

    url = 'http://a1.phobos.apple.com/us/r1000/000/Features/atv/' +
          'AutumnResources/videos/entries.json'
  
    response = HTTParty.get(url).to_s
    parsed = JSON.parse(response)
    parsed.each do |item|
      item['assets'].each do |asset|
        filename = asset['timeOfDay'] + '-' + asset['id'] + '.mov'
        filepath = File.join(aerialdir, filename)
        if File.exists?(filepath)
          puts "File #{filename} already exists, skipping..."
        else
          puts "Downloading #{filename} to #{aerialdir}"
          open(asset['url']) do |u|
            File.open(filepath, 'wb') { |f| f.write(u.read) }
          end
        end
      end
    end
    
    puts 'Finished processing all URLs!'
  
    # Copies the xscreensaver script to the target folder.
    FileUtils.cp("#{__dir__}/aerial_ruby_client/xscreensaver_script.rb", aerialdir)
  end
end
