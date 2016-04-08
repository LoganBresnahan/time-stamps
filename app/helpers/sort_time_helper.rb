module SortTimeHelper

  def seconds_converter(formated_time)
    if formated_time.match(/([0-9]*):([0-9]*)/)
      minutes = formated_time.match(/([0-9]*)/)[0]
      seconds = formated_time.match(/\:([0-9]*)/)[1]
      return (minutes.to_i * 60) + seconds.to_i
    else
      return formated_time = 0
    end
  end

  def sort_time(array)
    array.sort_by do |stamp|
      seconds_converter(stamp.time)
    end
  end

end
