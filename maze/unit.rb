
    maze = [["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"], 
    ["*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*", " ", " ", " ", "E", "*"], 
    ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", "*", "*", "*"], 
    ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
    ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
    ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
    ["*", "S", " ", " ", " ", "*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*"], 
    ["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]]

    # origin = [6,1]

    position = [5,1]
    direction = 4

    def mazemover(position, direction, maze)
        posrow, poscol = position[0], position[1]

        case direction
        when 1
            maze[posrow - 1][poscol] = "X"
            newpos = [posrow - 1, poscol]
        when 2
            maze[posrow][poscol -1] = "X"
            newpos = [posrow, poscol -1]
        when 3
            maze[posrow + 1][poscol] = "X"
            newpos = [posrow + 1,poscol]
        when 4
            maze[posrow][poscol +1] = "X"
            newpos = [posrow,poscol +1]
        end
        newpos
    end

    p mazemover(position, direction, maze)