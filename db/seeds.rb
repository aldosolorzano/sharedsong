# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
TAB = "\t"
path_to_csv = Rails.root.join('db', 'recording-500.csv')
CSV.foreach(path_to_csv, {:col_sep => TAB}) do |row|
  song = row[2]
  Song.create(
    name: song
  )
end
puts "#{Song.count} songs were created"
