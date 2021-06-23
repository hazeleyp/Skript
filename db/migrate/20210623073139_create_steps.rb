class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :name
      t.text :description
      t.text :expectedOutcome
      t.string :status
      t.string :testUser
      t.string :testDepartment
      t.string :linkedIssue
      t.string :dateTested
      t.references :script, null: false, foreign_key: true

      t.timestamps
    end
  end
end
