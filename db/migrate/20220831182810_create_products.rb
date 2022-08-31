class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :existencia
      t.decimal :precio
      t.references :categories, null: false, foreign_key: true
      t.references :suppliers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
