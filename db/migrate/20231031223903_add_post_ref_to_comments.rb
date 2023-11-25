class AddPostRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :post, index: true, null: false, foreign_key: true
  end
end
