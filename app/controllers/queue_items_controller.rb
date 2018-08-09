class QueueItemsController < ApplicationController
  before_filter :require_user

  def index
    @queue_items = current_user.queue_items
  end

  def create
    @queue_item = QueueItem.new(queue_item_params)
    @queue_item.position = current_user.queue_items.count + 1
    @queue_item.save unless current_user_has_queued_video?(@queue_item.video)

    redirect_to queue_path
  end

  def destroy
    current_user.queue_items.delete(params[:id])

    redirect_to queue_path
  end

  private

  def queue_item_params
    params.require(:queue_item).permit(:video_id, :user_id)
  end

  def current_user_has_queued_video?(video)
    current_user.queue_items.map(&:video).include?(video)
  end
end
