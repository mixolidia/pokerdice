require_relative 'die'

FACES = %w[ 9 T J Q K A ]

describe Die do
  specify "roll" do
    @die=Die.new
    expect(@die.top_face).to satisfy { |p| FACES.include? (p)  }
  end

  
end
