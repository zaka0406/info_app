class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.string :name
      t.string :text
      t.text :image
      t.timestamps
    end
  end
end
