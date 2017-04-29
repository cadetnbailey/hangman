require "minitest/autorun"
require_relative "hangman.rb"

class Testhangmanfunctions < Minitest::Test

	def test_returns_upcased_word
		hangman = Hangman.new("HeLLo")
		assert_equal("HELLO",hangman.name)
	end

	def test_class_returns_name
		hangman = Hangman.new("Hello")
		assert_equal(5,hangman.charcount)
	end

	def test_class_returns_five_blanks
		hangman = Hangman.new("Hello")
		assert_equal(["_","_","_","_","_"],hangman.blank)
	end

	def test_class_returns_if_in_password
		hangman = Hangman.new("hello")
		letter = "O"
		assert_equal(true,hangman.correct_letter?(letter))
	end

	def test_class_user_guess_is_pushed_into_array
		hangman = Hangman.new("hello")
		hangman.guessed = ["S","T","B"]
		letter = "Y"
		assert_equal(["S","T","B","Y"],hangman.update_guessed(letter))
	end

	def test_returns_correct_index_positions
		hangman = Hangman.new("hello")
		letter="H"
		hangman.correct_index(letter)
		assert_equal(["H","_","_","_","_"],hangman.correct_blank)
	end

	def test_returns_correct_positions
		hangman = Hangman.new("hello")
		hangman.correct_blank = ["H","_","_","_","_"]
		letter="L"
		hangman.correct_index(letter)
		assert_equal(["H","_","L","L","_"],hangman.correct_blank)
	end
	
	def test_returns_incorrect_guess
		hangman = Hangman.new("hello")
		letter="K"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","_","_"],hangman.correct_blank)
	end

	def test_returns_correct_guess
		hangman = Hangman.new("hello")
		hangman.correct_blank = ["H","_","L","L","_"]
		letter="E"
		hangman.correct_index(letter)
		assert_equal(["H","E","L","L","_"],hangman.correct_blank)
	end

	def test_class_see_if_guess_is_guessed
		hangman = Hangman.new("hello")
		hangman.guessed = ["o","w","p"]
		letter = "o"
		assert_equal(false,hangman.availible_guess(letter))
	end
	def test_class_see_if_guess_is_guessedj
		hangman = Hangman.new("hello")
		hangman.guessed = ["o","w","p"]
		letter = "y"
		assert_equal(true,hangman.availible_guess(letter))
	end
	def test_valid_letter
		hangman = Hangman.new("hello")
		letter = "H"
		assert_equal(true,hangman.correct_letter?(letter))
	end
	def test_invalid_letter
		hangman = Hangman.new("hello")
		letter = "q"
		assert_equal(false,hangman.correct_letter?(letter))
	end



end