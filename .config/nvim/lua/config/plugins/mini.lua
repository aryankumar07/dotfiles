return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
      local move = require 'mini.move'
      move.setup()
      local pairs = require 'mini.pairs'
      pairs.setup()
      local tabline = require 'mini.tabline'
      tabline.setup()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup()
      local starter = require 'mini.starter'
      local NameHeaders = {
        [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠤⠒⠒⠒⠒⠒⠤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡲⢋⠝⠋⣛⣳⡄⠀⠀⠀⠀⠀⠀⠉⠓⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⠠⣴⠗⢀⠥⠂⢁⠤⠤⠤⠁⠀⠀⠀⠀⠀⠀⠀⠀⣛⠛⠉⠗⠒⠲⢤⣀⠀
⠰⠃⠐⠀⠋⡠⠀⠮⠤⠤⠤⠤⡤⡄⠀⠀⠀⠀⠀⠀⢠⣽⠄⠀⠀⠀⠀⠀⢸⡆
⠀⠜⠀⠀⠈⠀⢠⣤⣔⣒⡒⠒⠂⠁⠀⡀⢀⣀⣤⣶⣿⡟⠀⠀⠀⠀⠀⢀⡼⠀
⠈⠀⠀⠀⠀⣰⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠉⠁⠀⠀⠀⢄⡴⠋⠀⠀
⠀⠀⠀⠀⣰⠋⠀⠀⠀⠈⠙⠛⠛⠛⠛⠋⠉⠀⠀⠀⠀⢀⣠⣴⡊⠁⠀⠀⠀⠀
⠀⡠⠐⠉⢸⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⣤⣶⣿⣿⣿⡻⡄⠀⠀⠀⠀
⠀⠁⠀⠀⣿⢹⣿⣿⣿⣶⣦⣶⣶⣶⣶⣶⣙⠋⠴⠛⣿⢛⡿⠬⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠘⠹⣿⣿⠛⠛⠛⢿⡇⠀⠉⠀⠘⠉⢰⣯⡊⠙⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠱⡄⠀⠀⠘⠃⠀⠀⠀⠀⠠⠛⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⢲⣄⠀⠒⠂⠀⣀⢴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣀⣀⣀⣈⠀⢻⣿⣶⣴⣾⡟⢸⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡎⠀⢀⣠⡤⠂⢠⠈⢿⣿⡿⣿⠃⠀⠙⣀⣀⣀⡀⠀⠙⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⠉⠉⢇⠀⠈⡇⠘⣏⠀⡿⡰⠀⠀⢀⠛⠛⠻⣆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⠉⠉⠉⠗⠒⢿⡀⠸⡈⣠⠧⠞⠉⡏⠉⠉⠉⢹⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⠁⠀⠉⠉⠀⠀⠈⠀⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀
    ]],
        [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠀⠀⠀⢠⣾⣧⣤⡖⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠋⠀⠉⠀⢄⣸⣿⣿⣿⣿⣿⣥⡤⢶⣿⣦⣀⡀
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡆⠀⠀⠀⣙⣛⣿⣿⣿⣿⡏⠀⠀⣀⣿⣿⣿⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠷⣦⣤⣤⣬⣽⣿⣿⣿⣿⣿⣿⣿⣟⠛⠿⠋⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡆⠀⠀
⠀⠀⠀⠀⣠⣶⣶⣶⣿⣦⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠈⢹⡏⠁⠀⠀
⠀⠀⠀⢀⣿⡏⠉⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⡇⠀⠀⠀
⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡘⣿⣿⣃⠀⠀⠀
⣴⣷⣀⣸⣿⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠹⣿⣯⣤⣾⠏⠉⠉⠉⠙⠢⠀
⠈⠙⢿⣿⡟⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣄⠛⠉⢩⣷⣴⡆⠀⠀⠀⠀⠀
⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣀⡠⠋⠈⢿⣇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀
    ]],
        [[
                            (  )/
                             )(/
          ________________  ( /)
         ()__)____________)))))
    ]],
        [[
  *   )                             )        (
` )  /(    )  (          (       ( /(    (   )\ )
 ( )(_))( /(  )(    (    )\  (   )\())  ))\ (()/(
(_(_()) )(_))(()\   )\ )((_) )\ ((_)\  /((_) ((_))
|_   _|((_)_  ((_) _(_/( (_)((_)| |(_)(_))   _| |
  | |  / _` || '_|| ' \))| |(_-<| ' \ / -_)/ _` |
  |_|  \__,_||_|  |_||_| |_|/__/|_||_|\___|\__,_|

	  ]],
        [[
___________                   .__       .__               .___
\__    ___/____ _______  ____ |__| _____|  |__   ____   __| _/
  |    |  \__  \\_  __ \/    \|  |/  ___/  |  \_/ __ \ / __ |
  |    |   / __ \|  | \/   |  \  |\___ \|   Y  \  ___// /_/ |
  |____|  (____  /__|  |___|  /__/____  >___|  /\___  >____ |
               \/           \/        \/     \/     \/     \/
	  ]],
        [[
┏┳┓      • ┓    ┓
 ┃ ┏┓┏┓┏┓┓┏┣┓┏┓┏┫
 ┻ ┗┻┛ ┛┗┗┛┛┗┗ ┗┻

	  ]],
        [[

▄▄▄█████▓ ▄▄▄       ██▀███   ███▄    █  ██▓  ██████  ██░ ██ ▓█████ ▓█████▄
▓  ██▒ ▓▒▒████▄    ▓██ ▒ ██▒ ██ ▀█   █ ▓██▒▒██    ▒ ▓██░ ██▒▓█   ▀ ▒██▀ ██▌
▒ ▓██░ ▒░▒██  ▀█▄  ▓██ ░▄█ ▒▓██  ▀█ ██▒▒██▒░ ▓██▄   ▒██▀▀██░▒███   ░██   █▌
░ ▓██▓ ░ ░██▄▄▄▄██ ▒██▀▀█▄  ▓██▒  ▐▌██▒░██░  ▒   ██▒░▓█ ░██ ▒▓█  ▄ ░▓█▄   ▌
  ▒██▒ ░  ▓█   ▓██▒░██▓ ▒██▒▒██░   ▓██░░██░▒██████▒▒░▓█▒░██▓░▒████▒░▒████▓
  ▒ ░░    ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░   ▒ ▒ ░▓  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░ ▒▒▓  ▒
    ░      ▒   ▒▒ ░  ░▒ ░ ▒░░ ░░   ░ ▒░ ▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░ ░ ▒  ▒
  ░        ░   ▒     ░░   ░    ░   ░ ░  ▒ ░░  ░  ░   ░  ░░ ░   ░    ░ ░  ░
               ░  ░   ░              ░  ░        ░   ░  ░  ░   ░  ░   ░
                                                                    ░
	  ]],
        [[
⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⣿⣿⣿⣿⣷⣽⣿⣿⣇⡈⢿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀
⠀⠀⠀⣼⣿⣿⣿⣿⡿⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⢿⣿⠀⠘⣿⡿⢿⡄⠁⠈⢻⣯⢻⢾⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀
⠀⠀⣸⡿⢁⣼⣿⣷⡘⠋⢿⢿⡿⠁⠀⢠⣿⣿⠃⠀⣼⡏⠀⠀⠘⢧⠀⠹⣆⠀⢸⣿⡀⡜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀
⠀⢠⣿⣷⠟⣷⣿⡿⠁⠂⢨⡿⠁⠀⢀⣿⢿⡏⢀⣾⣿⠁⣀⢀⡀⠬⠳⡄⠘⢷⣀⣿⡇⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣤⣤
⠀⣼⣿⣏⣟⠻⣿⣇⠀⢠⡾⠁⠀⣴⣿⢃⡟⢀⣾⡿⠋⠉⠀⠀⠀⠀⠀⠈⠢⡀⣿⢻⡇⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠈⠉
⢀⣿⣿⣿⡟⢺⣿⣿⣤⠟⠀⣠⣾⡿⢁⣾⡡⠋⠋⣠⣴⣖⣶⣶⣦⣤⣴⣀⡀⠈⠻⣿⣏⡀⣸⡿⠟⠛⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀
⢸⣿⣿⡷⠀⣾⣿⣿⣏⣠⡞⢟⣋⡀⠛⠉⠀⠀⠀⠙⠿⠟⠉⠈⣩⣿⣿⣿⣹⡇⠀⠀⣿⢧⡏⠀⢠⠋⠓⠹⣿⣿⣿⡇⠀⠀⠀⠀
⢸⢿⣇⢠⠀⣿⣿⡿⢿⠿⠻⠿⣿⣍⠁⠀⠀⠀⠀⠀⠀⠀⠀⢺⡿⠿⠛⣿⠿⠁⠀⢸⡟⢸⠁⠠⢾⡒⠃⠀⣿⣿⣿⣧⠀⠀⠀⠀
⢸⠘⣿⣿⣥⣿⣿⣷⡸⡀⠀⣼⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡿⠤⠔⠃⠀⠀⢠⡿⢡⠏⣠⡼⣶⠏⠀⣠⣿⣿⣿⣿⠀⠀⠀⠀
⠸⠀⣿⣿⣛⣿⣿⣿⣧⠑⠀⠹⣧⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⣡⠏⠠⣠⠔⠁⢀⣼⣿⣿⣿⣿⣿⠀⠀⠀⠀
⠀⠀⢹⣿⣷⣿⣿⢿⣿⡄⠀⠀⠀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠁⠀⢀⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⢿⠻⣿⣿⡄⠙⣧⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢟⡿⠃⠀⠀⡴⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀
⠀⠀⠀⠈⠁⠈⠻⣷⡄⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠈⠀⠀⠀⡼⠁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄
⠀⠀⠀⠀⠀⠀⠀⠈⠙⠦⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠎⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⠾⠋⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣶⣤⣀⣀⣤⡶⠋⠀⠀⠀⠀⠀⠀⠀⣀⡠⠤⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠉
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⢀⣴⠟⣛⡀⠀⢞⣛⣿⢿⣟⣛⣉⡙⠛⠻⣿⣿⣿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣠⠎⢹⠰⠁⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⡇⢀⡇⠸⡿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⢀⡔⠁⢀⠼⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡝⢧⡀⢷⣧
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣇⢀⠴⠋⢀⠔⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠳⡘⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡷⠟⠋⠀⣀⣀⢤⡔⠁⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⢻
    ]],
        [[
         _.._..,_,_
        (          )
         ]~,"-.-~~[
       .=])' (;  ([
       | ]:: '    [
       '=]): .)  ([
         |:: '    |
          ~~----~
    ]]
      }

      math.randomseed(os.time())
      local random_logo = math.random(#NameHeaders)

      starter.setup(
        {
          header = NameHeaders[random_logo],
          footer = "",
        }
      )
    end
  }
}
