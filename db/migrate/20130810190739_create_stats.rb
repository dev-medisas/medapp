class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :patient_id
      t.float :temp
      t.integer :systolic
      t.integer :diastolic
      t.integer :heart_rate
      t.integer :resp_rate
      t.datetime :noted_at

      t.timestamps
    end
  end
end
