class CreateHumen < ActiveRecord::Migration[6.1]
  def change
    create_table :humen do |t|
      t.string :name
      t.datetime :birth
      t.string :cpf
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
