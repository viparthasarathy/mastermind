module Mastermind

  class Game

    attr_reader :answer

    def initialize
  	  @answer = []
  	  color_hash = {1 => "blue", 2 => "red", 3 => "black", 4 => "white",
  	  			   5 => "green", 6 => "brown", 7 => "purple", 8 => "orange"}
  	  4.times {@answer.push(rand(8) + 1)}
  	  @answer.map! { |value| value = color_hash[value] }
  	end

  	def guess
  	  puts "Please enter four choices out of the following colors: blue, red, black, white, green, brown, purple, and orange."
  	  choices = []
  	  i = 1
  	  while i <= 4
  	    puts "Choice #{i}:"
  	    colors = ["blue", "red", "black", "white", "green", "brown", "purple", "orange"]
  	  	choice = get.chomps.downcase
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
  	  while i <= 12
  	    puts "Round #{i}"
  	    player_choices = guess
  	    perfect_answer = 0
  	    imperfect_answer = 0
  	    player_choices.each_with_index do |color, position|
  	      if @answer[position] = color
  	      	perfect_answer += 1
  	      end
  	    puts "You have guessed #{perfect_answer} choices correct in both position and color."
  	    player_choices.each do |color|
  	      if @answer.any? color
  	        imperfect_answer += 1
  	      end
  	      imperfect_answer -= perfect_answer
  	    end
  	    puts "You have guessed #{imperfect_answer} choices correct in color but not position."
  	    if perfect_answer == 4
  	      puts "You have won the game! Congratulations!"
  	      i = 13
  	    else
  	      i += 1
  	    end
  	  end
  	end

  end

end
