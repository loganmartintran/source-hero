#create 10 users
10.times do
  User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

#create 20 topics
20.times do
  Topic.create!(
    title: Faker::Hacker.adjective,
    user: users.sample
  )
end

topics = Topic.all

#create 100 bookmarks
100.times do
  Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample
  )
end

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
