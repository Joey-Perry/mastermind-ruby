require_relative 'codemaker.rb'
require_relative 'codebreaker.rb'

class Game 
    attr_reader :codemaker
    def initialize
        @codemaker = Codemaker.new
        @codebreaker = Codebreaker.new
    end

    def receive_guess
        puts "Please enter your guess: "
        user_guess = gets.chomp.split(",").map { |color| color.strip}
    end

    def compare_guess_to_secret_code(user_guess)
        comparison_array = []
        for i in 0...4
            if @codemaker.secret_code[i] == user_guess[i]
                comparison_array << true 
            else
                comparison_array << false
            end
        end
        comparison_array
    end

    def give_user_feedback(comparison_array, user_guess)
        on_fire = 0
        warm = 0
        warm_array = []
        for i in 0...4
            if comparison_array[i] == false
                warm_array << @codemaker.secret_code[i]
                if warm_array.include?(user_guess[i])
                    warm += 1
                end
            end
        end
        comparison_array.each do |value|
            if value == true
                on_fire += 1
            end
        end
        puts "On fire: #{on_fire}"
        puts "Warm: #{warm}"
    end

    def user_is_codebreaker_game_loop
        # obtain user guess
        user_guess = receive_guess
        # compare guess to secret code
        comparison_array = compare_guess_to_secret_code(user_guess)
        give_user_feedback(comparison_array, user_guess)
        # if code is an exact match then game over
        if comparison_array == [true, true, true, true]
            puts "Congratulations! You cracked the code: #{@codemaker.secret_code}"
        else
            # otherwise, subtract a turn, give feedback and then start over
            turns_left = @codebreaker.used_a_turn
            if  turns_left == 0
                puts "Game over. Secret code was: #{@codemaker.secret_code}"
            else
                puts "You have #{turns_left} turns left."
                game_loop
            end
        end
    end

    def user_is_codemaker_game_loop
        puts "Create your code: "
        user_secret_code = gets.chomp.split(",").map { |color| color.strip}
        computer_generate_guess
        compare_computer_guess_to_user_code
        display_feedback #then go back to computer_generate_guess
    end
end

new_game = Game.new
puts "Enter guess"
p new_game.codemaker.secret_code
new_game.user_is_codebreaker_game_loop