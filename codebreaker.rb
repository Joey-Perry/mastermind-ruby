class Codebreaker 
    attr_reader :turns_left
    def initialize
        @turns_left = 12
    end

    def used_a_turn
        @turns_left -= 1
    end
end