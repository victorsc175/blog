include UserHelper

Given('I am a guest user') do
  # default
end

Given("I am a logged in user") do
  user = FactoryGirl.create(:user)
  login(user.email, user.password)
end

Given("I am a creator") do
  user = FactoryGirl.create(:user, creator: true)
  login(user.email, user.password)
end

Given("I am a moderator") do
  user = FactoryGirl.create(:user, moderator: true)
  login(user.email, user.password)
end