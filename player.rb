class Player
  attr_accessor :nama, :blood, :manna
  def initialize nama
    @nama = nama
    @blood = 100
    @manna = 40
    end

  def all
    puts "#{@nama}"
  end

  def isGameOver
  	@manna <= 0 || @blood <= 0
  end
end
