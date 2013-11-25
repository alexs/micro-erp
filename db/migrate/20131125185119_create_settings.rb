class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.decimal :usd
      t.references :user

      t.timestamps
    end
    add_index :settings, :user_id
  end
end
