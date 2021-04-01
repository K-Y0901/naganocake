class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item_name
      t.text :description
      t.boolean :sale_status, default: true, null: false
      t.integer :non_taxed_price
      t.integer :image_id

      t.timestamps
    end
  end
end
