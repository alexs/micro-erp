class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :status_id
      t.boolean :sold
      t.references :user
      t.references :job_type

      t.timestamps
    end
    add_index :jobs, :user_id
    add_index :jobs, :job_type_id
  end
end
