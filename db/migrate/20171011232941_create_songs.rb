class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :file
      t.string :source
      t.string :author
      t.integer :duration
      t.boolean :loop
      t.float :attr_stress
      t.float :attr_epicness
      t.float :attr_happiness

      t.timestamps
    end
  end
end
