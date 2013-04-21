Given(/^(.+) is friends with (.+)$/) do |user_name, friend_name|
  user = User.find_by(username: user_name)
  friend = User.find_by(username: friend_name)
  user.friends << friend.id
  user.save
end
