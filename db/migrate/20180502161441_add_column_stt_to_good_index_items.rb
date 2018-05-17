class AddColumnSttToGoodIndexItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :good_index_items, :stt, :string
  end
end
