class Hand
  attr_accessor :counts, :dice

  def initialize(dice = [])
    @dice = dice
  end

  def face_values
    @dice.map { |e| e.face_value }
  end

  def rank
    @counts = Hash.new(0)
    face_values.each do |face|
      @counts[face]+= 1
    end

    case
    when @counts.values.include?(5)
      'five of a kind'
    when @counts == {"T" => 1, "J" => 1, "Q" => 1, "K" => 1, "A" => 1}
      'straight hand'
    else
      'bupkis'
    end

  end

end
