module SortTimeHelper

  def seconds_converter(formated_time)
    minutes = formated_time.match(/([0-9]*)/)[0]
    p seconds = formated_time.match(/\:([0-9]*)/)[1]
    return (minutes.to_i * 60) + seconds.to_i
  end

  def sort_time(array)
    array.sort_by do |stamp|
      seconds_converter(stamp.time)
    end
  end

end
