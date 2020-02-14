class StreamChannel < ApplicationCable::Channel
  UNIX_PROCESS_COMMAND = 'top -bn1'
  periodically :transmit_process_data, every: 5.seconds

  def subscribed
    stream_from "stream_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def transmit_process_data
    transmit message: process_data
  end

  private

  def process_data
    stdout_str, error_str, status = Open3.capture3(UNIX_PROCESS_COMMAND)
    return stdout_str if status.success?
  end

end
