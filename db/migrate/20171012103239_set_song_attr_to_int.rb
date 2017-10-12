class SetSongAttrToInt < ActiveRecord::Migration[5.1]
  def up
    change_table :songs do |t|
      t.change :attr_stress, :integer
      t.change :attr_epicness, :integer
      t.change :attr_happiness, :integer
    end
  end
  def down
    change_table :tablename do |t|
      t.change :attr_stress, :float
      t.change :attr_epicness, :float
      t.change :attr_happiness, :float
    end
  end
end
