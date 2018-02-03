namespace :ffaker do
  desc 'Generates test blog data'
  task create_data: :environment do
    require 'data_faker/blog_data_faker'

    BlogDataFaker::Builder.create_data
  end
end
