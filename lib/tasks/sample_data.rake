namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_comments
  end
end

def make_users
  admin = User.create!(name:     "Sriram Kumar",
                       email:    "ksrirambecse@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_comments
  users = User.all(limit: 10)
  microposts = Micropost.all(limit:20)
  content = Faker::Lorem.sentence(5)
  10.times do
    users.each do |user|
      microposts.each do |micropost|
        micropost.comments.create!(content: content, user_id: user.id)
      end
    end
  end
end