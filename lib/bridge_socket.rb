require_relative 'bridge_socket/version'
require 'socket'


class BridgeSocket
private
  def do_pipe(fr, fw)
    Thread.start{
      begin
        while v = fr.read(1024)
          fw.write(v)
        end
      rescue
      end
    }
  end

public
  def self.test(args)
    args.each{|arg|
      unless arg and (File.stat(arg).chardev? or File.stat(arg).socket?)
        raise RuntimeError, "character device or socket is required - #{arg}"
      end
    }
  end

  attr_accessor :retry_interval

  def initialize
    @retry_interval = 5
  end
  
  def start(file1, file2, &block)
    files = [file1, file2]
    @retry = true
    while @retry
      begin
        @socks = files.map{|s| File.open(s, 'w+') rescue UNIXSocket.open(s) }
      rescue => e
        return unless @retry
        yield("retry after #{@retry_interval} sec.", e) if block_given?
        sleep @retry_interval
        retry
      end
      yield("Starting #{files.join(" <=> ")}.", nil) if block_given?
      @thread = do_pipe(*@socks)
      do_pipe(*@socks.reverse)
      @thread.join
      @socks.each{|s| s.close rescue nil }
      yield("disconnected.", nil) if block_given?
    end
  end

  def stop
    @retry = false
    @socks.each{|s| s.close rescue nil }
    @thread.join rescue nil
    @socks  = []
    @thread = nil
  end
end
