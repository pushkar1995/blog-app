class AddUserRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :user, index: true, null: false, foreign_key: true
  end
end
