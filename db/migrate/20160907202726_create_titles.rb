class CreateTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :titles do |t|
      t.string :tag
      t.string :content
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
