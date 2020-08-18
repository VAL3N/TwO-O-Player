require_relative 'player'
require_relative 'question'

@turn = 0 # ---> initial value player turn
@inProgress = true

##Set up for Game
puts "Welcome to MATH QUIZ!"

print 'Player 1 name: '
@username = gets.chomp
player1 = Player.new(@username)
puts player1.name

print 'Player 2 name: '
@username = gets.chomp
player2 = Player.new(@username)
puts player2.name

puts "Alright then you two, let us begin."

# ----------------------------------------------------#


while @inProgress

  question = Question.new # ---> calls new question
  
  case @turn # ---> establishes who's turn and outputs their name
  when 0
    print "#{player1.name}: "
  else 
    print "#{player2.name}: "
  end
  
  print question.to_string
  @user_input = gets.chomp.to_i
  puts @user_input


  if @turn == 0 && question.is_right(@user_input)
    puts "YES! Well done, you are correct."
    # puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
    # puts "------ New Turn ------"
    @turn += 1
  elsif @turn == 0 && !question.is_right(@user_input)
    puts "Seriously? No. Try again."
    # puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
    # puts "------ New Turn ------"
    player1.lose_life
    @turn += 1
  elsif @turn == 1 && question.is_right(@user_input)
    puts "CORRECT! Well done."
    # puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
    # puts "------ New Turn ------"
    @turn -= 1
  elsif @turn == 1 && !question.is_right(@user_input)
    puts "WRONG! Try again"
    # puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
    # puts "------ New Turn ------"
    player2.lose_life
    @turn -= 1
  end

  puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
  puts "------ New Turn ------"







  if player1.lives < 1 || player2.lives <1
    puts "Game OVER."
    if player1.lives < 1
      puts "The winner is #{player2.name} with a score of #{player2.lives}/3"
    elsif player2.lives < 1
      puts "The winner is #{player1.name} with a score of #{player1.lives}/3"
    end
    @inProgress = false
  end


end
