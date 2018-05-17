class CreateGoodIndexItems < ActiveRecord::Migration[5.1]
  def change
    create_table :good_index_items do |t|
      t.string :ma_hang
      t.string :ten_hang
      t.string :dvt
      t.integer :so_luong
      t.integer :don_gia
      t.integer :thanh_tien
      t.string :ghi_chu
      t.references :good_index_record, foreign_key: true

      t.timestamps
    end
  end
end
