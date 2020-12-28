require_relative 'codemaker.rb'
require_relative 'codebreaker.rb'

class Game 
    attr_reader :codemaker
    def initialize
        @codemaker = Codemaker.new
        @codebreaker = Codebreaker.new
    end

    def receive_guess
        user_guess = gets.chomp.split(",").map { |color| color.strip}
    end

    def compare_guess_to_secret_code
        puts "Please enter your guess: "
        user_guess = receive_guess
        comparison_array = []
        for i in 0...4
            if @codemaker.secret_code[i] == user_guess[i]
                comparison_array << true 
            else
                # does the color exist in the secret_code outside of the elements marked 'true' ?
                if @codemaker.secret_code.include?(user_guess[i]) 
                    comparison_array << 'maybe'
                else
                    comparison_array << false
                end
            end
        end
        comparison_array
    end

    def give_user_feedback(comparison_array)
        on_fire = 0
        warm = 0
        comparison_array.each do |value|
            if value == true
                on_fire += 1
            elsif value == 'maybe'
                warm += 1
            else
                nil
            end
        end
        puts "On fire: #{on_fire}"
        puts "Warm: #{warm}"
    end

    def game_loop
        # obtain user guess
        # compare guess to secret code
        comparison_array = compare_guess_to_secret_code
        give_user_feedback(comparison_array)
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

end

new_game = Game.new
puts "Enter guess"
p new_game.codemaker.secret_code
p new_game.game_loop