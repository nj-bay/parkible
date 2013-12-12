class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.decimal :price
      t.string :address
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at


      t.timestamps
    end
  end
end
