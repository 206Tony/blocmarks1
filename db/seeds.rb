require 'random_data'
require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all


10.times do
  Topic.create!(
    title: Faker::Lorem.sentence,
    user: users.sample
  )
end
topics = Topic.all

20.times do
  Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample
  )
end

member = User.create!(
  email: 'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  confirmed_at: Time.now
)

member = User.create!(
  email: 'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  confirmed_at: Time.now,
  role: 'admin'
)

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
puts "#{User.count} users created"