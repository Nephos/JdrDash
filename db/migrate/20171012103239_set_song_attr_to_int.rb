class SetSongAttrToInt < ActiveRecord::Migration[5.1]
  def up
    change_table :songs do |t|
      t.change :attr_stress, :integer, default: 0
      t.change :attr_epicness, :integer, default: 0
      t.change :attr_happiness, :integer, default: 0
    end
  end
  def down
    change_table :songs do |t|
      t.change :attr_stress, :float
      t.change :attr_epicness, :float
      t.change :attr_happiness, :float
    end
  end
end
