
class Maze

    def initialize
        @maze = mazereader
    end

    def mazereader
        file = File.open("mazedoc.txt")
        file_data = file.readlines.map(&:chomp)

        maze = []
        file_data.each do |line|
            maze << line.split("")
        end
        maze
    end


    # [["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"], 
    # ["*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*", " ", " ", " ", "E", "*"], 
    # ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", "*", "*", "*"], 
    # ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
    # ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
    # ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
    # ["*", "S", " ", " ", " ", "*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*"], 
    # ["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]]

    # origin = [6,1]


    def originfinder
        originpos = []
        @maze.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                originpos = [i, j] if ele == "S"
            end
        end
        originpos
    end


    def movereader(pos)
        posrow, poscol = pos[0], pos[1]
        valmovesarr = []
        adjsquares = []

        adjsquares << @maze[posrow - 1][poscol]
        adjsquares << @maze[posrow][poscol -1] 
        adjsquares << @maze[posrow + 1][poscol]
        adjsquares << @maze[posrow][poscol +1]

        if adjsquares.include?("E")
            puts "you did it! you found the exit!"
            mazeprinter
            exit
        end

        count = 1
        adjsquares.each do |ele| 
            valmovesarr << count if ele == " "
            count += 1
        end

        valmovesarr
    end

    def collisiondetector(position, direction)
        posrow, poscol = position[0], position[1]

        case direction
        when 1
            return true if @maze[posrow - 1][poscol] == " "
        when 2
            return true if @maze[posrow][poscol -1] == " "
        when 3
            return true if @maze[posrow + 1][poscol] == " "
        when 4
            return true if @maze[posrow][poscol +1] == " "
        end

        false
    end


    def mazemover(position, direction)
        posrow, poscol = position[0], position[1]

        case direction
        when 1
            @maze[posrow - 1][poscol] = "X"
            newpos = [posrow - 1, poscol]
        when 2
            @maze[posrow][poscol -1] = "X"
            newpos = [posrow, poscol -1]
        when 3
            @maze[posrow + 1][poscol] = "X"
            newpos = [posrow + 1,poscol]
        when 4
            @maze[posrow][poscol +1] = "X"
            newpos = [posrow,poscol +1]
        end
        newpos
    end


    def mazerunner
        while true
            position = originfinder
            valmovesarr = movereader(position)
            direction = valmovesarr.shuffle[0]

            while true
                if direction == nil
                    @maze = mazereader
                    p "let's try again"
                    break
                end

                if collisiondetector(position, direction)
                    position = mazemover(position, direction)
                else
                    valmovesarr = movereader(position)
                    direction = valmovesarr.shuffle[0]
                end

                mazeprinter
            end
        end
    end

    def mazeprinter
        @maze.each do |row|
            row.each do |ele|
                print ele
            end
            puts ""
        end
    end

end


b = Maze.new
b.mazerunner


# 1 up [-1, +0]
# 2 left [0, -1]
# 3 down [+1, +0]
# 4 right [0, +1]

# done -  read all possible moves
# done - ascertain arr of possible directions (" " and "E" only)
# done - if E is in arr, end 
#   - I will want to print the route

# if arr is empty, start loop over from origin.

# pick new direction randomly
# continue moving in that direction until next stop is * or X
# - rewrite the maze with X in spot I was just in
# - print the maze
# start loop over. 






