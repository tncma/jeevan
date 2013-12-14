class CreateMenaces < ActiveRecord::Migration
  def change
    create_table :menaces do |t|
      t.string :uuid
      t.string :name
      t.string :email
      t.text   :what
      t.text   :where

      t.timestamps
    end
  end
end
