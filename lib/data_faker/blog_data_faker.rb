module BlogDataFaker
  class Builder
    USERS = 10
    POSTS = 15
    PARAGRAPHS = 10
    COMMENTS = 30
    COMMENTS_RANGE = 3..5
    MARKS = 30
    CREATORS = 7
    MODERATORS = 2
    SEO_KEYWORDS = 4
    class << self
      def create_data
        destroy_old_data
        USERS.times { user.save! }
        set_creators
        set_moderators
        users = User.all
        POSTS.times { post(title, paragraphs(PARAGRAPHS),users.sample).save! }
        COMMENTS.times { comment(users.sample).save! }
        posts = Post.all
        MARKS.times do
          begin
            mark(users.sample, posts.sample).save!
          rescue
            puts "Mark already exists, skipped"
          end
        end
        (users + posts).each do |item|
          item.build_seo(seo.attributes)
          item.seo.save!
        end
      end

      def destroy_old_data
        Seo.destroy_all
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
        FFaker::Lorem.paragraphs(size) * ' '
      end

      def title
        FFaker::Lorem.sentence
      end

      def post(title, body, user)
        Post.new title: title, body: body, user: user
      end

      def comment(user)
        body = FFaker::Lorem.paragraph
        commentable_item = commentable
        c = Comment.new body: body,
                    user: user,
                    commentable_id: commentable_item.id,
                    commentable_type: commentable_item.class.to_s
      end
      
      def commentable
        [User.all, Post.all].sample.sample
      end

      def mark(user, post)
        value = COMMENTS_RANGE.to_a.sample
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
                description: FFaker::Lorem.paragraph(1)[0...160],
                keywords: FFaker::Lorem.words(SEO_KEYWORDS)  
      end
    end
  end
end