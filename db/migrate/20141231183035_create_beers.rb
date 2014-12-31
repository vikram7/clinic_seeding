class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text :name, null: false
      t.text :description
      t.float :abv
      t.integer :style_id, null: false

      t.timestamps
    end
  end
end
