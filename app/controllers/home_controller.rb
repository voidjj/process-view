class HomeController < ApplicationController
  before_action :user_logged?

  def index
    ActionCable.server.broadcast 'stream_channel', nil
  end
end
