class CreateUserParties < ActiveRecord::Migration[7.0]
  def change
    create_table :user_parties do |t|
      t.boolean :is_host
      
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
