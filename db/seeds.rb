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

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
