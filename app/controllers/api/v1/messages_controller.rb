class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    render json: @channel.messages
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:name])
  end

  def message_params
    params.require(:message).permit(:author, :content)
  end
end
