class Player
    attr_reader :name
    attr_accessor :losses

    def initialize(name)
        @name = name
        @losses = 0
    end

    def nexchar(fragment)
        if fragment.length == 0
            puts "#{@name}, add the first character to the fragment."
        else
            puts "#{@name}, add the next character to #{fragment}. Or, type challenge to force the last player to complete their word."
        end

        begin
            ans = gets.chomp
            raise "" unless ans.length == 1 || ans == "challenge"
        rescue
            puts "Just type a single character or challenge pls"
            retry
        end
        ans
    end

    def losetoexistingword
        puts "#{@name}, that is an existing word. You lose."
        exit
    end

end