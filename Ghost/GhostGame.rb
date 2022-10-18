require_relative "AIplayer.rb"
require_relative "player.rb"

class Ghost
    attr_reader :dictionary

    def initialize(numofplayers)
        @dictionary = File.read("dictionary.txt").split.to_set
        @fragment = ""
        @players = []
            numofplayers.times do |i|
                puts "Enter name for player #{i + 1}"
                ans = gets.chomp
                @players << Player.new(ans)
            end

        @cur_player = @players[0]
    end

    def next_player!
        @prev_player = @cur_player
        @cur_player = @players[(@players.index(@cur_player) + 1) % @players.length]
    end

    def play_round
        while true
            while true
                loser = nil
                nexchar = @cur_player.nexchar(@fragment)
                if nexchar == "challenge"
                    loser = self.challenge
                else
                    @fragment += nexchar
                end
                
                if @dictionary.include?(@fragment)
                    puts "#{@cur_player.name}, that is an existing word. You lose."
                    loser = @cur_player
                end

                if loser
                    loser.losses += 1
                    break
                end

                next_player!
            end
            nextroundsetup
            if @players.length == 1 
                puts "Congrats #{@players[0].name}, you are the winner!"
                exit
            end
            @fragment = ""
            @cur_player = @players.sample
            puts "5 losses and you are out. Get ready for the next round"
        end

    

    end

    def nextroundsetup
        loser = nil
        @players.each_with_index do |player, i|
            if player.losses == 2
                puts "#{player.name}, you have 5 losses and are out"
                loser = i
            else
                puts "#{player.name}, your losses are #{player.losses}"
            end
        end
        @players.delete_at(loser) if loser
    end

    def challenge
        puts "#{@prev_player.name}, your word has been challenged. Type the full word starting with #{@fragment}"
        ans = gets.chomp
        begin
            raise "" if ans[0...@fragment.length] != @fragment
        rescue
            puts "that didn't use the whole fragment! Try again."
            retry
        end
        if @dictionary.include?(ans)
            puts "#{@cur_player.name}, the other player passed your challenge. You lose"
            loser = @cur_player
        else
            puts "#{@prev_player.name}, that is not a real word. You lose"
            loser = @prev_player
        end
        loser
    end



end
