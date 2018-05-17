module Api
	module V1
		class GoodIndexRecordsController < ApplicationController
			def index
				records = GoodIndexRecord.order('created_at DESC')
				render json: records, status: :ok
			end

			def show
				record = GoodIndexRecord.find(params[:id])
				render json: record.to_json(:include => :good_index_items), status: :ok
			end

			def create
				
				good_index_record = GoodIndexRecord.new(good_index_record_params)
				if good_index_record.save
					g = GoodIndexRecord.last
					good_index_items_params[:good_index_items].each {|item|
						 g.good_index_items.create(item)}
					
					render json: {status: 'SUCCESS', message: 'Saved storagee', data: "storagee"}, status: :ok
				else
					render json: {status: 'ERROR', message: 'GoodIndexRecord not saved', data: ""}, status: :unprocessable_entity
				end
			end

			def destroy

				good_index_record = GoodIndexRecord.find(params[:id])
				good_index_items = good_index_record.good_index_items

				good_index_items.each {|item| item.destroy}
				if good_index_record.destroy
					render json: {status: 'SUCCESS', message: 'GoodIndexRecord destroyed', data: ""}, status: :ok
				else
					render json: {status: 'ERROR', message: 'GoodIndexRecord not saved', data: ""}, status: :unprocessable_entity
				end
			end

			def update
				# storagee = GoodIndexRecord.find(params[:id])
				# if storagee.update_attributes(storagee_params)
				# 	render json: {status: 'SUCCESS', message: 'GoodIndexRecord updated', data: storagee}, status: :ok
				# else
				# 	render json: {status: 'ERROR', message: 'GoodIndexRecord not updated', data: storagee.errors}, status: :unprocessable_entity
				# end
				p good_index_items_params
				good_index_record = GoodIndexRecord.find(params[:id])
				good_index_items = good_index_record.good_index_items

				good_index_items.each_with_index {|item, index| item.update_attributes(good_index_items_params[:good_index_items][index])}
				if good_index_record.update_attributes(good_index_record_params)
					render json: {status: 'SUCCESS', message: 'Update success', data: ""}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Update failed', data: ""}, status: :unprocessable_entity
				end
			end
			private 

			def good_index_record_params
				params.require(:good_index_record).permit(:number, :storage_type)
			end
			def good_index_items_params
				params.require(:good_index_record).permit(good_index_items: [:stt, :ma_hang, :ten_hang, :dvt, :don_gia, :so_luong, :thanh_tien, :ghi_chu] )
			end
		end
	end
	
end