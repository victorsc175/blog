class AddCommentableToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :commentable, polymorphic: true
    remove_reference :comments, :post
  end
end
