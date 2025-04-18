function loadColors()
    colorOpts = {'white', 'blue', 'red', 'yellow', 'orange', 'green'}

    colors = {
        ['white'] = {1,1,1,1},
        ['blue'] = {0,0,1,1},
        ['red'] = {1,0,0,1},
        ['yellow'] = {1,1,0,1},
        ['orange'] = {1,.4,.2,1},
        ['green'] = {0,1,0,1}
    }

    white = colors['white']
    blue = colors['blue']
    red = colors['red']
    yellow = colors['yellow']
    orange = colors['orange']
    green = colors['green']
    gray = {.3, .3, .3, 1}
end