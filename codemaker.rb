class Codemaker 
    attr_reader :secret_code
    def initialize
        @secret_code = generate_secret_code
    end

    def generate_random_color
        random_number = rand(6)
        case random_number
        when 0
            "red"
        when 1
            "blue"
        when 2
            "yellow"
        when 3
            "green"
        when 4
            "white"
        when 5
            "black"
        else
            puts "Error"
        end
    end

    def generate_secret_code
        secret_code = []
        4.times { secret_code << generate_random_color }
        secret_code
    end
end