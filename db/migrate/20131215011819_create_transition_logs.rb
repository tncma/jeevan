class CreateTransitionLogs < ActiveRecord::Migration
  def change
    create_table :transition_logs do |t|
      t.string :from
      t.string :to
      t.integer :menace_id

      t.timestamps
    end
  end
end
