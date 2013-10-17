class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :job_title
      t.integer :company_id
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
