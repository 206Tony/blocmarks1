class AddUserToBookmarks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :bookmarks, :user, index: true, foreign_key: true
  end
end
