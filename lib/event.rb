# frozen_string_literal: true

require 'pry'
require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(time_start, duration_time, title, email_array)
    @start_date = Time.parse(time_start)
    @duration = duration_time
    @title = title
    @attendees = email_array
  end

  def postpone_24h
    @start_date += 24 * 60 * 60
  end

  def end_date
  @start_date += @duration*60
  end

  def is_past?
   if Time.now > @start_date
    return true
   else
    return false
   end
  end

  def is_future?
    if Time.now < @start_date
     return true
    else
     return false
    end
   end

   def is_soon?
    if (@start_date - Time.now) > 0 && (@start_date - Time.now) <= 30*60
      p "Event starts in #{((@start_date - Time.now)/60).round} min"
    elsif (@start_date - Time.now) < 0 
     p "Event already finished"
    else
      p "Event starts in more than 30 min"
    end
   end
  
   def to_s
    puts "Title: #{@title}"
    puts "Start date: #{@start_date}"
    puts "Duration: #{@duration} minutes"
    puts "Attendees: #{@attendees.join(", ")}"
   end


end

private

def check_time(time_start)
  true if time_start.length == 16
end

def check_duration(_duration_time)
  true if duration.is_a? Integer
  
end

binding.pry
p 'end of file'
