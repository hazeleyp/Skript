class CreateScripts < ActiveRecord::Migration[6.0]
  def change
    create_table :scripts do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :context
      t.string :version
      t.string :owningApp
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
