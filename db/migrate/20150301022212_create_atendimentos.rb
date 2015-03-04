class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.date :date
      t.string :customer
      t.text :description

      t.timestamps null: false
    end
  end
end
