class AddAvatarToDeeds < ActiveRecord::Migration[5.1]
  def up
    add_attachment :deeds, :avatar
  end

  def down
    remove_attachment :deeds, :avatar
  end
end
