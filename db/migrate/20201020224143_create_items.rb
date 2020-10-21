class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :description,            null: false
      t.integer :price,               null: false
      t.references :user,             null: false,foreign_key: true
      t.integer :itemcategory_id,     null: false
      t.integer :itemsalesstatus_id,  null: false
      t.integer :itemshipping_id,     null: false
      t.integer :itemprefecture_id,   null: false
      t.integer :itemscheduled_id,    null: false
      t.timestamps
    end
  end
end
