namespace :ffaker do
  desc "Generates test blog data"
  task create_data: :environment do
    require 'data_faker'

    class BlogDataFaker
      include DataFaker
      AMOUNT_OF_USERS = 10
      AMOUNT_OF_POSTS = 10
      AMOUNT_OF_PARAGRAPHS = 3
      AMOUNT_OF_COMMENTS = 15
      AMOUNT_OF_MARKS = 15
      
      def create_data
        AMOUNT_OF_USERS.times { fake_user.save }
        users = User.all
        AMOUNT_OF_POSTS.times do
          fake_post(fake_title,
                    fake_paragraphs(AMOUNT_OF_PARAGRAPHS),
                    users.sample).save
        end
        posts = Post.all
        AMOUNT_OF_COMMENTS.times do 
          fake_comment(users.sample, posts.sample).save
        end
        AMOUNT_OF_MARKS.times do
          fake_mark(users.sample, posts.sample).save
        end
      end
    end
    
    BlogDataFaker.new.create_data
  end
end
