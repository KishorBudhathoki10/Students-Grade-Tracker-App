module GradesHelper

  def find_active_activity(params)
    arr = [[nil, nil, nil, nil], [nil, nil, nil, nil]]

    if params[:writing]
      arr[0][1] = 'active'
      arr[1][1] = 'show active'
    elsif params[:listening]
      arr[0][2] = 'active'
      arr[1][2] = 'show active'
    elsif params[:reading]
      arr[0][3] = 'active'
      arr[1][3] = 'show active'
    else
      arr[0][0] = 'active'
      arr[1][0] = 'show active'
    end

    arr
  end

end
