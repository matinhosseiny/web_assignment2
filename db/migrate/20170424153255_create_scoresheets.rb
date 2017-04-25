class CreateScoresheets < ActiveRecord::Migration[5.0]
  def change
    create_table :scoresheets do |t|
      t.integer :teamnumber
      t.references :user, foreign_key: true
      t.integer :correctness
      t.integer :creativity
      t.integer :relevence
      t.integer :sustainability
      t.integer :userexperience

      t.timestamps
    end
  end
end
