require "./Player.rb"
require "./Question.rb"

class Game
  def initialize
    puts "What is player 1's name?"
    @player1 = Player.new(gets.chomp)
    puts "Player 1 name is #{@player1}"

    puts "What is player 2's name?"
    @player2 = Player.new(gets.chomp)
    puts "Player 2 name is #{@player2}"

    @round = 1
  end

  def run_game
    max_rounds = 5
    rounds_played = 0
  
    while rounds_played < max_rounds && (@player1.lives > 0 && @player2.lives > 0)
      start_game
      rounds_played += 1
    end
    check_winner # Check for the winner and assign it to @winner
    print_final_result(winner) unless @winner.nil? # Print the final result
  end
  
  def start_game
    get_question

    if check_answer?
      puts "YES! You are correct."
    else
      puts "No! You are incorrect."
      decrement_lives
    end

    toggle_turn
    print_result
    check_winner
    @round += 1
  end

  def get_question
    @question = Question.new
    puts "----- ROUND #{@round} of 5 -----" unless @round == 1
    current_player = @player1.turn ? @player1 : @player2
    puts "Player #{current_player.name}'s Turn: #{@question.question}"
  end

  def check_answer?
    gets.chomp.to_i == @question.answer
  end

  def toggle_turn
    @player1.turn = !@player1.turn
    @player2.turn = !@player2.turn
  end

  def decrement_lives
    current_player = @player1.turn ? @player1 : @player2
    current_player.lives -= 1
  end

  def print_result
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def print_final_result(winner)
    puts "----- GAME OVER -----"
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "Thank you, play again"
  end

  def check_winner
    winner = @player1.lives == 0 ? @player2 : (@player2.lives == 0 ? @player1 : nil)
    print_final_result(winner) unless winner.nil?
  end
end
