require './player.rb'
require './question.rb'

class Game
  def initialize
    @current_player = nil
    @player1 
    @player2
  end

  def start_game

    puts "Welcome to the Math Game first player, what is your name?"
    @player1 = Player.new(gets.chomp)

    puts "Welcome to the Math Game second player, what is your name?"
    @player2 = Player.new(gets.chomp)

    puts "#{@player1.name} start first! \n"
    @current_player = @player1

    start_round while (@player1.lives > 0 && @player2.lives > 0)

    end_game
  end


  def change_current_player
    if (@current_player == @player1)
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def start_round
    puts "----New Round----"
    question = Question.new
    puts "#{@current_player.name}: What does #{question.value1} + #{question.value2} equal?"

    player_answer = gets.chomp.to_i 
    if(player_answer == question.answer)
      puts "#{@current_player.name} Correct Answer! \n"
      puts "\n"
    else
      puts "#{@current_player.name} Wrong Answer! \n"
      @current_player.lives += -1
      puts "\n"
    end

    puts "#{@player1.name} - #{@player1.lives}/3 and #{@player2.name} - #{@player2.lives}/3"

    change_current_player
  end

  def end_game
    puts "---GAME IS OVER---"
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    puts "Thanks for playing!"
  end
end