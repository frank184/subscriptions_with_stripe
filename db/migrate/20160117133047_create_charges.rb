class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :user, index: true, foreign_key: true
      t.float :amount
      t.string :card_last_four
      t.string :card_brand
      t.string :card_exp_month
      t.string :card_exp_year
      t.string :stripe_id

      t.timestamps null: false
    end

    add_index :charges, :stripe_id, unique: true
  end
end
