class RemoveNameFromInfos < ActiveRecord::Migration[7.0]
  def change
    remove_column :infos, :name, :string
  end
end
