require_relative 'codemaker.rb'

class UserIsCodemaker 
    def initialize
        @codemaker = Codemaker.new
    end

    def computer_generate_guess
        computer_guess = @codemaker.secret_code
        puts "Computer first guess is: #{computer_guess}"
        computer_guess
    end

    def obtain_user_secret_code
        puts "Create your code: "
        user_secret_code = gets.chomp.split(",").map { |color| color.strip}
    end

    def compare_computer_guess_to_user_code(computer_guess, user_secret_code)
        comparison_array = []
        for i in 0...4
            if user_secret_code[i] == computer_guess[i]
                comparison_array << true 
            else
                comparison_array << false
            end
        end
        comparison_array
    end

    def computer_guess_loop(comparison_array, computer_guess)
        new_guess = []
        for i in 0...4
            if comparison_array[i] == true
                new_guess << computer_guess[i]
            elsif comparison_array[i] == false
                new_guess << @codemaker.generate_random_color
            else
                nil
            end
        end
        new_guess
    end

    def game_loop(user_secret_code, computer_guess)
        if user_secret_code == computer_guess
            puts "Computer figured out the secret code: #{computer_guess}."
        else
            comparison_array = compare_computer_guess_to_user_code(computer_guess, user_secret_code)
            new_guess = computer_guess_loop(comparison_array, computer_guess)
            puts "Computer new guess is: #{new_guess}"
            game_loop(user_secret_code, new_guess)
        end
    end


    def game
        user_secret_code = obtain_user_secret_code()
        computer_guess = computer_generate_guess()
        game_loop(user_secret_code, computer_guess)
    end
end