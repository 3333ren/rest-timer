class CreateAlarms < ActiveRecord::Migration[6.0]
  def change
    create_table :alarms do |t|
      
      t.string :task, null: false
      t.references :user, null: false, foregien_key: true
      t.timestamps
    end
  end
end
