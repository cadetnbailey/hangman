class Hangman
	attr_accessor :name,:guessed,:correct_blank,:counter

	def initialize(password_name)
		@name = password_name.upcase
		@guessed = []
		@correct_blank = blank
		@counter = 7
	end

	def correct_letter?(letter)
		name.include?(letter)
	end
	def make_move(letter)
		if correct_letter?(letter)
			correct_index(letter)
		else
				@counter-=1
		end
	end

	def charcount
		name.length
	end
	def blank
		Array.new(charcount,"_")
	end
	def correct_letter?(letter)
		name.include?(letter)
	end
	def update_guessed(letter)
		guessed.push(letter)
	end
	def verified_guessed(letter)
		guessed.push(letter)
	end
	def correct_index(guessletter)
		password=name.split("")
		p guessletter
		p password
		password.each_with_index do |letter,index_position|
		p letter	
			if letter == guessletter
				correct_blank[index_position] = guessletter
				p correct_blank

			end
		end
	end
	def availible_guess(choice)
		if guessed.count(choice) == 0
			true
	    else
			false
		end
		
	end
	def loser
		counter == 0
	end
	def winner
		if correct_blank.include?("_")
		false
		else
		true
		end
	end
end
