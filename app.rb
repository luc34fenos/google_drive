require 'bundler'
Bundler.require
require "google_drive"
require 'json'
require 'pp'
require 'nokogiri'
require 'open-uri'
require 'csv'


$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapp/scrapper'
require 'spreadsheet_scrapper/ssheet'
require 'CSV_files/make_csv'

lien = 'http://annuaire-des-mairies.com/val-d-oise.html'
doc = Nokogiri::HTML(open(lien))
files = get_all_the_urls_of_val_doise_townhalls(doc, lien)

File.open("db/email.JSON", "w") do |f|
	f.write(files.to_json)
end

ssheet("db/email.JSON")
make_csv(files)

p "mission acconplie!!!"