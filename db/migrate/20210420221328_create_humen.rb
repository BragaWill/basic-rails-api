class CreateHumen < ActiveRecord::Migration[6.1]
  def change
    create_table :humen do |t|
      t.string :name, null: false
      t.datetime :birth, null: false
      t.string :cpf, null: false, unique: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
