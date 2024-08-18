local K = {}
local lead = '<leader>'

--- Leader key
K.LEADER = '<space>'

--- Tmux navigation keymaps
K.JUMP_TO_LEFT_PANE = '<C-h>'
K.JUMP_TO_RIGHT_PANE = '<C-l>'
K.JUMP_TO_TOP_PANE = '<C-k>'
K.JUMP_TO_BOTTOM_PANE = '<C-j>'

--- General code navigation keymaps
K.GOTO_ = 'g'
K.GOTO_DEFINITION = 'gd'
K.GOTO_REFERENCES = 'gr'
K.GOTO_IMPLEMENTATION = 'gi'
K.GOTO_TYPE_DEFINITION = 'gD'

--- Documentation keymaps
K.DOCS_ = 'D'
K.DOCS_SIGNATURE_HELP = 'Ds'
K.DOCS_SYMBOLS = 'Dy'
K.DOCS_HOVER = 'Dh'

--- Code shortcuts
K.CODE_ = lead .. 'c'
K.CODE_ACTIONS = lead .. 'ca'
K.CODE_RENAME = lead .. 'cr'
K.CODE_SWAP = lead .. 'cs'

--- Debug keymaps
K.DEBUG_ = lead .. 'd'
K.DEBUG_TOGGLE_UI = lead .. 'dt'
K.DEBUG_CONTINUE = lead .. 'dc'
K.DEBUG_TOGGLE_BREAKPOINT = lead .. 'db'
K.DEBUG_PREV_MESSAGE = lead .. 'd['
K.DEBUG_NEXT_MESSAGE = lead .. 'd]'
K.DEBUG_OPEN_DIAGNOSTIC = lead .. 'do'
K.DEBUG_OPEN_DIAGNOSTIC_LIST = lead .. 'dl'
K.DEBUG_STEP_ = lead .. 'ds'
K.DEBUG_STEP_INTO = lead .. 'dsi'
K.DEBUG_STEP_OVER = lead .. 'dsj'
K.DEBUG_STEP_OUT = lead .. 'dso'

--- Window keymaps
K.TOGGLE_EXPLORER = lead .. 'e'

--- Git related keymaps
K.GIT_ = lead .. 'g'
K.GIT_PULL = lead .. 'gp'
K.GIT_PUSH = lead .. 'gP'
K.GIT_OPEN_LAZY_GIT = lead .. 'gg'
K.GIT_DIFF_INDEX = lead .. 'gd'
K.GIT_DIFF_LAST_COMMIT = lead .. 'gD'
K.GIT_HUNK_ = lead .. 'gh'
K.GIT_HUNK_STAGE = lead .. 'ghs'
K.GIT_HUNK_RESET = lead .. 'ghr'
K.GIT_BUFFER_STAGE = lead .. 'ghS'
K.GIT_BUFFER_RESET = lead .. 'ghR'
K.GIT_STAGE_UNDO = lead .. 'ghu'
K.GIT_HUNK_PREVIEW = lead .. 'ghp'
K.GIT_LINE_BLAME = lead .. 'ghb'
K.GIT_TOGGLE_BLAME = lead .. 'gtb'
K.GIT_TOGGLE_SHOW_DELETED = lead .. 'gtd'

--- Search utilities
K.SEARCH_ = lead .. 's'
K.SEARCH_FILES = lead .. 'sf'
K.SEARCH_IN_CURRENT_BUFFER = lead .. 's/'
K.SEARCH_IN_EDITOR_SETTINGS = lead .. 'ss'
K.SEARCH_HELP = lead .. 'sh'
K.SEARCH_CURRENT_WORD = lead .. 'sw'
K.SEARCH_GREP = lead .. 'sg'
K.SEARCH_GREP_GIT_ROOT = lead .. 'sG'
K.SEARCH_DIAGNOSTICS = lead .. 'sd'
K.SEARCH_RESUME = lead .. 'sr'
K.SEARCH_RECENT_FILES = lead .. 's?'
K.SEARCH_OPEN_BUFFERS = lead .. 's<space>'

--- Formatting keymaps
K.FORMAT_CURRENT_BUFFER = lead .. 'f'

--- Tabs keymaps
K.TABS_ = 't'
K.TABS_GOTO_PREVIOUS = 'th'
K.TABS_GOTO_NEXT = 'tl'
K.TABS_MOVE_LEFT = 't<'
K.TABS_MOVE_RIGHT = 't>'
K.TABS_GOTO_1 = 't1'
K.TABS_GOTO_2 = 't2'
K.TABS_GOTO_3 = 't3'
K.TABS_GOTO_4 = 't4'
K.TABS_GOTO_5 = 't5'
K.TABS_GOTO_6 = 't6'
K.TABS_GOTO_7 = 't7'
K.TABS_GOTO_8 = 't8'
K.TABS_GOTO_9 = 't9'
K.TABS_GOTO_LAST = 't0'
K.TABS_PIN = 'tp'
K.TABS_CLOSE_CURRENT = 'tx'

--- Yarn keymaps
K.YARN_ = lead .. 'y'
K.YARN_ADD = lead .. 'ya'
K.YARN_CHANGE_VERSION = lead .. 'yv'

return K
