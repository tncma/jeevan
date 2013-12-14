# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["deepak", "pavithra", "nethra", "siddharth", "alex", "sindhu", "athulan", "sainath"].each do |name|
  m = Menace.create!(
    :name => name,
    :email => "#{name}@example.com",
    :what => "Blah",
    :where => "Foo"
  )
  puts m
end

puts User.create!(:email => "deepaksrm@gmail.com", :password => "password")
