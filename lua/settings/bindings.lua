local K = {}
local lead = '<leader>'

K.LEADER = '<space>'

K.GOTO_DEFINITION = 'gd'
K.GOTO_REFERENCES = 'gr'
K.GOTO_IMPLEMENTATION = 'gi'
K.GOTO_TYPE_DEFINITION = 'gD'

K.DOCS_SIGNATURE_HELP = 'Ds'
K.DOCS_SYMBOLS = 'Dy'
K.DOCS_HOVER = 'Dh'

K.CODE_ACTIONS = lead .. 'ca'
K.CODE_RENAME = lead .. 'cr'
K.CODE_SWAP = lead .. 'cs'

K.DEBUG_TOGGLE_UI = lead .. 'dt'
K.DEBUG_CONTINUE = lead .. 'dc'
K.DEBUG_TOGGLE_BREAKPOINT = lead .. 'db'
K.DEBUG_PREV_MESSAGE = lead .. 'd['
K.DEBUG_NEXT_MESSAGE = lead .. 'd]'
K.DEBUG_OPEN_DIAGNOSTIC = lead .. 'do'
K.DEBUG_OPEN_DIAGNOSTIC_LIST = lead .. 'dl'
K.DEBUG_STEP_INTO = lead .. 'dsi'
K.DEBUG_STEP_OVER = lead .. 'dsj'
K.DEBUG_STEP_OUT = lead .. 'dso'

K.TOGGLE_EXPLORER = lead .. 'e'

K.GIT_PULL = lead .. 'gp'
K.GIT_PUSH = lead .. 'gP'
K.GIT_OPEN_LAZY_GIT = lead .. 'gg'
K.GIT_DIFF_INDEX = lead .. 'gd'
K.GIT_DIFF_LAST_COMMIT = lead .. 'gD'
K.GIT_HUNK_STAGE = lead .. 'ghs'
K.GIT_HUNK_RESET = lead .. 'ghr'
K.GIT_BUFFER_STAGE = lead .. 'ghS'
K.GIT_BUFFER_RESET = lead .. 'ghR'
K.GIT_STAGE_UNDO = lead .. 'ghu'
K.GIT_HUNK_PREVIEW = lead .. 'ghp'
K.GIT_LINE_BLAME = lead .. 'ghb'
K.GIT_TOGGLE_BLAME = lead .. 'gtb'
K.GIT_TOGGLE_SHOW_DELETED = lead .. 'gtd'

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
K.SEARCH_OPEN_BUFFERS = lead .. '<space>'

K.FORMAT_CURRENT_BUFFER = lead .. 'f'

K.WORKSPACE_SYMBOLS = lead .. 'ws'
K.WORKSPACE_ADD_FOLDER = lead .. 'wa'
K.WORKSPACE_REMOVE_FOLDER = lead .. 'wr'
K.WORKSPACE_LIST_FOLDER = lead .. 'wl'

K.YARN_ADD = lead .. 'ya'
K.YARN_CHANGE_VERSION = lead .. 'yv'

return K
