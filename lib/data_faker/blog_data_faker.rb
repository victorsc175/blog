module BlogDataFaker
  # Populate blog fake data
  class Builder
    USERS = 25
    POSTS = 60
    PARAGRAPHS = 20
    COMMENTS = 1000
    MARKS_RANGE = 1..5
    MARKS = 100
    CREATORS = 7
    MODERATORS = 2
    SEO_KEYWORDS = 4
    CLEAR_DATA = [Seo, Mark, Comment, Post, User].freeze
    SEO_META_SIZE = 160

    class << self
      def create_data
        destroy_old_data
        create_users
        set_creators
        set_moderators
        create_posts
        create_comments
        create_marks
        create_seo
      end

      def destroy_old_data
        CLEAR_DATA.each(&:destroy_all)
      end

      def create_users
        USERS.times { user.save! }
      end

      def create_posts
        POSTS.times { post(title, paragraphs(PARAGRAPHS), users.sample).save! }
      end

      def create_comments
        COMMENTS.times { comment(users.sample).save! }
      end

      def create_marks
        MARKS.times { mark(users.sample, posts.sample).save }
      end

      def create_seo
        (users + posts).each { |i| i.create_seo(seo.attributes) }
      end

      def user
        username = FFaker::Name.name
        User.new name: username,
                 email: email(username),
                 password: password(username)
      end

      def users
        User.all
      end

      def email(username)
        username.downcase.split.join('.') +
          '@' +
          FFaker::Company.bs.split.first +
          '.com'
      end

      def password(username)
        email(username)
      end

      def paragraph
        FFaker::Lorem.paragraph
      end

      def paragraphs(size)
        FFaker::Lorem.paragraphs(size) * ' '
      end

      def title
        FFaker::Lorem.sentence
      end

      def post(title, body, user)
        Post.new title: title, body: body, user: user
      end

      def posts
        Post.all
      end

      def comment(user)
        body = FFaker::Lorem.paragraph
        commentable_item = commentable
        Comment.new body: body,
                    user: user,
                    commentable_id: commentable_item.id,
                    commentable_type: commentable_item.class.to_s
      end

      def commentable
        [User.all, Post.all].sample.sample
      end

      def mark(user, post)
        value = MARKS_RANGE.to_a.sample
        Mark.new value: value, user: user, post: post
      end

      def set_creators
        User.first(CREATORS).each { |u| u.update creator: true }
      end

      def set_moderators
        User.first(MODERATORS).each { |u| u.update moderator: true }
      end

      def seo
        Seo.new title: FFaker::Lorem.sentence,
                description: FFaker::Lorem.paragraph(1)[0...SEO_META_SIZE],
                keywords: FFaker::Lorem.words(SEO_KEYWORDS)
      end
    end
  end
end
