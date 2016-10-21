class ActiveUsersChannel < ApplicationCable::Channel
  include NoBrainer::Streams

  def subscribed
    @user = User.create
    transmit current_user: @user
    stream_from User.all, include_initial: true
  end

  def unsubscribed
    @user.destroy
  end

  def select_cells(message)
    @user.update! selected_cells: message['selected_cells']
  end
end
