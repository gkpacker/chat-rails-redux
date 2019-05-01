class ChannelsController < ApplicationController
  before_action :set_channel

  def show
    if @channel.blank?
      redirect_to channel_path(Channel.first.name)
    else
      @channels = Channel.all
    end
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:id])
  end
end
