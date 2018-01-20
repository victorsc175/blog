module BlogDataFaker
  class Builder
    AMOUNT_OF_USERS = 10
    AMOUNT_OF_POSTS = 15
    AMOUNT_OF_PARAGRAPHS = 3
    AMOUNT_OF_COMMENTS = 30
    AMOUNT_OF_MARKS = 30
    class << self
      def create_data
        destroy_old_data
        AMOUNT_OF_USERS.times { user.save }
        users = User.all
        AMOUNT_OF_POSTS.times do
          post(title,
               paragraphs(AMOUNT_OF_PARAGRAPHS),
               users.sample).save
        end
        posts = Post.all
        AMOUNT_OF_COMMENTS.times do
          comment(users.sample, posts.sample).save
        end
        AMOUNT_OF_MARKS.times do
          mark(users.sample, posts.sample).save
        end
      end

      def destroy_old_data
        Mark.destroy_all
        Comment.destroy_all
        Post.destroy_all
        User.destroy_all
      end

      def user
        username = FFaker::Name.name
        User.new name: username, email: email(username)
      end

      def email(username)
        username.downcase.split.join('.') +
        '@' +
        FFaker::Company.bs.split.first +
        '.com'
      end

      def paragraph
        FFaker::Lorem.paragraph
      end

      def paragraphs(size)
        paragraphs = []
        size.times { paragraphs += FFaker::Lorem.paragraphs }
        paragraphs.flatten * ' '
      end

      def title
        FFaker::Lorem.sentence
      end

      def post(title, body, user)
        Post.new title: title, body: body, user: user
      end

      def comment(user, post)
        body = FFaker::Lorem.paragraph
        Comment.new body: body, user: user, post: post
      end

      def mark(user, post)
        value = (3..5).to_a.sample
        Mark.new value: value, user: user, post: post
      end
    end
  end
end