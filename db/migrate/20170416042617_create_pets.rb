class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false
      t.string :name, null: true
      t.string :species, null: true
      t.string :breed, null: true
      t.string :age, null: true
      t.string :color, null: true

      t.timestamps
    end
  end
end
