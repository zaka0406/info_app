class AddUserIdToInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :infos, :user_id, :integer
  end
end
