// Formatting parameters only lightly configurable at the moment.
// Would need extension to support more complex formatting (e.g. questions).
var SHEET_PARAMS = {
  "script/denjuu/sms.messages.csv": {
    width: 6 * 8,
    min_lines: 6,
    line_spacing: 0,
    prelude: '',
    envoi: '<*4>'
  },
  "script/denjuu/descriptions.messages.csv": {
    width: 14 * 8,
    lines_per_page: 3,
    line_spacing: 1,
    prelude: '',
    envoi: '<*4>'
  },
  "script/story/all.messages.csv": {
    width: 16 * 8,
    lines_per_prompt: 2,
    line_spacing: 1
  },
  "script/npc/all.messages.csv": {
    width: 16 * 8,
    lines_per_prompt: 2,
    line_spacing: 1
  },
  "script/calls/story.messages.csv": {
    width: 16 * 8,
    lines_per_prompt: 2,
    line_spacing: 1
  },
  "script/calls/exp_item.messages.csv": {
    width: 16 * 8,
    lines_per_prompt: 2,
    line_spacing: 1,
    prelude: 'EXP_ITEM_DENJUU_NUMBER',
    envoi: '<*2>'
  },
  "script/npc/unused.messages.csv": {
    width: 16 * 8,
    lines_per_prompt: 2,
    line_spacing: 1
  },
  "script/calls/denjuu/all.messages.csv": {
    width: 16 * 8,
    lines_per_prompt: 2,
    line_spacing: 1,
    envoi: 'PHONE_LINE_TERMINATOR',
    questions: true
  }
}
