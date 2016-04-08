module SortTimeHelper

  def seconds_converter(formated_time)
    minutes = formated_time.match(/\#([0-9]*)/)[1]
    seconds = formated_time.match(/\:([1-9]*)/)[1]
    return (minutes.to_i * 60) + seconds.to_i
  end

  def sort_time(array)
    array.sort_by do |time|
      seconds_converter(time)
    end
  end
  
end
