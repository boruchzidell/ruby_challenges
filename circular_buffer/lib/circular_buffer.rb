#! /usr/bin/env ruby

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer_size = size
    @buffer = Array.new(@buffer_size)

    @oldest_index = 0
    @last_added_index = @buffer_size - 1
    @next_write_index = (@last_added_index + 1) % @buffer_size
  end

  def read
    raise self.class::BufferEmptyException if buffer_empty?

    value = @buffer[@oldest_index]
    @buffer[@oldest_index] = nil
    update_oldest_index!
    value
  end

  def write(value)
    return if value.nil?

    raise self.class::BufferFullException if buffer_full?

    @buffer[@next_write_index] = value
    update_next_write_index!
  end

  def write!(value)
    return if value.nil?

    if buffer_full?
      @buffer[@oldest_index] = value
      update_oldest_index!
    else
      write(value)
    end
  end

  def update_oldest_index!
    @oldest_index = (@oldest_index + 1) % @buffer_size
  end

  def update_next_write_index!
    @next_write_index = (@next_write_index + 1) % @buffer_size
  end

  def buffer_empty?
    @buffer.compact.empty?
  end

  def buffer_full?
    @buffer.compact.size == @buffer_size
  end

  def clear
    @buffer.clear
  end
end
