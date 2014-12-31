class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.text :name, null: false
      t.integer :ratebeer_id, null: false

      t.timestamps
    end
  end
end
