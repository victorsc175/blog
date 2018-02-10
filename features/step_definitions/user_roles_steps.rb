include UserHelper

Given('I am a guest user') do
  # default
end

Given("I am a logged in user") do
  user = FactoryGirl.create(:user)
  login(user.email, user.password)
end