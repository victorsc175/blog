require 'ffaker'

module DataFaker
  def fake_user
    username = fake_username
    email = fake_email(username)
    User.new name: username, email: email, creator: true
  end
  
  def fake_username
    FFaker::Name.name
  end
  
  def fake_email(username)
    username.downcase.split.join('.') +
    '@' +
    FFaker::Company.bs.split.first +
    '.com'
  end
  
  def fake_paragraph
    FFaker::Lorem.paragraph
  end
  
  def fake_paragraphs(size)
    paragraphs = []
    size.times { paragraphs += FFaker::Lorem.paragraphs }
    paragraph = paragraphs.flatten * ' '
  end
  
  def fake_title
    FFaker::Lorem.sentence
  end
  
  def fake_post(title, body, user)
    Post.new title: title, body: body, user: user
  end
  
  def fake_comment(user, post)
    body = FFaker::Lorem.paragraph
    Comment.new body: body, user: user, post: post
  end
  
  def fake_mark(user, post)
    value = (3..5).to_a.sample
    Mark.new value: value, user: user, post: post
  end
end