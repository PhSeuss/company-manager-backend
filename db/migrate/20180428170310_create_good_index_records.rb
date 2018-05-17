class CreateGoodIndexRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :good_index_records do |t|
      t.string :number
      t.integer :type

      t.timestamps
    end
  end
end
