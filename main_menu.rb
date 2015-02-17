load 'player.rb'
class MainMenu
  @@players = Array.new
  @@status = "new"

  def initialize
    choose()
    while(!isGameOver()) do
      get_player_input()
    end
  end

  def isGameOver
  	gameOver = false
	for player in @@players do
		gameOver = gameOver || player.isGameOver()
	end
	gameOver
  end

  def choose
    puts "#==============================#"
    puts " pilih 'new' atau 'begin' "
    puts "#==============================#"
  end

  def get_player_input 
  	if @@status == 'begin' 
  		@input = @@status
  	else
    	@input = gets.chomp
    end

    if @input.eql? "new"
      puts "masukan nama pemain"
      @nama = gets.chomp
      @@players.push Player.new @nama
    elsif @input.eql? "begin"
      if @@players.count < 2
        puts "jumlah pemain kurang"
      else 
      	@@status = 'begin'
        puts "siapa yang akan menyerang"
		@penyerang = gets.chomp
		puts "siapa yang akan diserang"
		@korban = gets.chomp
        for player in @@players do
        	if @penyerang == player.nama
        		player.manna -= 20
        	elsif @korban == player.nama
        		player.blood -= 20
        	end
        end

		for player in @@players do
			puts "#{player.nama} : manna = #{player.manna}, blood = #{player.blood}"
		end        
      end
    else
      puts "input tidak diketahui"
    end
  end
end

main = MainMenu.new

