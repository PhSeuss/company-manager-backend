class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :good_index_records, :type, :storage_type
  end
end
