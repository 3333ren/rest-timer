class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|

      t.string :good
      t.string :black
      t.references :user, null: false, foregien_key: true
      t.timestamps
    end
  end
end
