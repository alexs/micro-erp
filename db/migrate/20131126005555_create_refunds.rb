class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.date :deposit_date
      t.string :code
      t.references :job
       t.references :user_id
      t.decimal :amount, :precision => 10, :scale => 2

      t.timestamps
    end
    add_index :refunds, :job_id
  end
end
