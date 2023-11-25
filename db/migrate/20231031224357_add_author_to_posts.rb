class AddAuthorToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :author, index: true, foreign_key: { to_table: :users }
  end
end
