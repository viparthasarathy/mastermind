module Mastermind

  class Game

    attr_reader :answer

    def initialize
  	  answer = []
  	  color_hash = {1 => "blue", 2 => "red", 3 => "black", 4 => "white",
  	  			   5 => "green", 6 => "brown", 7 => "purple", 8 => "orange"}
  	  4.times { answer.push(rand(8) + 1) }
  	  answer.map! { |value| value = color_hash[value] }
      @answer = answer
  	end

  	def guess
  	  puts "Please enter four choices out of the following colors: blue, red, black, white, green, brown, purple, and orange."
  	  choices = []
  	  i = 1
  	  while i <= 4
  	    puts "Choice #{i}:"
  	    colors = ["blue", "red", "black", "white", "green", "brown", "purple", "orange"]
  	  	choice = gets.chomp.downcase
  	  	if colors.include? choice
		  choices.push(choice)
  	  	  i += 1
  	  	else
  	  		puts "Incorrect choice. Please try again."
  	  	end
  	  end
  	  choices
  	end

  	def play
  	  i = 1
      win = false
  	  while i <= 12
  	    puts "Round #{i}"
  	    player_choices = guess
  	    perfect_answer = 0
  	    imperfect_answer = 0
  	    player_choices.each_with_index do |color, position|
  	      perfect_answer += 1 if @answer[position] == color
        end
  	    puts "You have guessed #{perfect_answer} choice(s) correct in both position and color."
  	    @answer.each do |color|
  	      if player_choices.include? color
            imperfect_answer += 1 
            occurs = 0
            player_choices.each do |choice|
              if choice == color
                occurs += 1
              end
            end
            player_choices.delete(color)
            while occurs > 1
              player_choices.push(color)
              occurs -= 1
            end
          end
  	    end
        imperfect_answer -= perfect_answer
  	    puts "You have guessed #{imperfect_answer} choice(s) correct in color but not position."
  	    if perfect_answer == 4
          win = true
  	      i = 13
  	    else
  	      i += 1
  	    end
  	  end
      if win
        puts "You have won the game! Congratulations! The answer was #{@answer}."
      else
        puts "You have lost the game. Sorry. The answer was #{@answer}."
      end
  	end
  end
end

include Mastermind
playing = true
while playing
  round = Game.new
  puts "Welcome to Mastermind!"
  round.play
  puts "Input N to exit, or anything else to play again."
  choice = gets.chomp.upcase
  if choice == "N"
    playing = false
  else
    puts "Playing again!"
  end
end
