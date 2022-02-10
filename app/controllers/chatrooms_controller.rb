class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(portfolio_id: current_user).or(Chatroom.where(user_id: current_user))
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
