class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :file
      t.string :source
      t.string :author
      t.integer :duration
      t.boolean :loop
      t.integer :attr_stress
      t.integer :attr_epicness
      t.integer :attr_happiness

      t.timestamps
    end
  end
end
