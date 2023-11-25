class AddUserRefToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :user, index: true, null: false, foreign_key: true
  end
end
