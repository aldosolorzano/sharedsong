
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

# seed users

# 100.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name:  Faker::Name.last_name,
#     email:      Faker::Internet.email,
#     password:   'abc'
#   )
# end
#
# puts "#{User.count} users were created"
