class Hand
  def initialize(dice = [])
    @dice = dice

  end

  def face_values
    @dice.map { |e| e.face_value }
  end

  def rank
    faces = face_values.join
    counts = Hash.new(0)
    face_values.each do |face|
      counts[face]+= 1
    end

    case faces
    when /([9TJQKA])\1{4}/ ; 'five of a kind'
    else ; 'bupkis'
    end
  end

end
