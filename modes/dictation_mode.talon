mode: dictation
-
^press <user.modifiers>$: key(modifiers)
^press <user.keys>$: key(keys)

# Everything here should call `auto_insert()` (instead of `insert()`), to preserve the state to correctly auto-capitalize/auto-space.
# (Talonscript string literals implicitly call `auto_insert`, so there's no need to wrap those)
<user.raw_prose>: auto_insert(raw_prose)
cap: user.dictation_format_cap()
# Hyphenated variants are for Dragon.
(no cap | no-caps): user.dictation_format_no_cap()
(no space | no-space): user.dictation_format_no_space()
^cap that$: user.dictation_reformat_cap()
^(no cap | no-caps) that$: user.dictation_reformat_no_cap()
^(no space | no-space) that$: user.dictation_reformat_no_space()

# Navigation
go up <number_small> (line|lines):
    edit.up()
    repeat(number_small - 1)
go down <number_small> (line|lines):
    edit.down()
    repeat(number_small - 1)
go left <number_small> (word|words):
    edit.word_left()
    repeat(number_small - 1)
go right <number_small> (word|words):
    edit.word_right()
    repeat(number_small - 1)
go line start: edit.line_start()
go line end: edit.line_end()

# Selection
select left <number_small> (word|words):
    edit.extend_word_left()
    repeat(number_small - 1)
select right <number_small> (word|words):
    edit.extend_word_right()
    repeat(number_small - 1)
select left <number_small> (character|characters):
    edit.extend_left()
    repeat(number_small - 1)
select right <number_small> (character|characters):
    edit.extend_right()
    repeat(number_small - 1)
clear left <number_small> (word|words):
    edit.extend_word_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> (word|words):
    edit.extend_word_right()
    repeat(number_small - 1)
    edit.delete()
clear left <number_small> (character|characters):
    edit.extend_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> (character|characters):
    edit.extend_right()
    repeat(number_small - 1)
    edit.delete()

# Formatting
formatted <user.format_text>:
    user.dictation_insert_raw(format_text)
^format selection <user.formatters>$:
    user.formatters_reformat_selection(formatters)

# Corrections
scratch that: user.clear_last_phrase()
scratch selection: edit.delete()
select that: user.select_last_phrase()
spell that <user.letters>: auto_insert(letters)
spell that <user.formatters> <user.letters>:
    result = user.formatted_text(letters, formatters)
    user.dictation_insert_raw(result)

# Escape, type things that would otherwise be commands
^escape <user.text>$:
    auto_insert(user.text)
(semi colon | semicolon): auto_insert(";")
cap <user.text>: 
    result = user.formatted_text(user.text, "CAPITALIZE_FIRST_WORD")
    auto_insert(result)
#navigation
go up <number_small> lines:
    edit.up()
    repeat(number_small - 1)
go down <number_small> lines:
    edit.down()
    repeat(number_small - 1)
go left <number_small> words: 
    edit.word_left()
    repeat(number_small - 1)
go right <number_small> words: 
    edit.word_right()
    repeat(number_small - 1)
#selection
select left <number_small> words:
    edit.extend_word_left()
    repeat(number_small - 1)
select right <number_small> words:
    edit.extend_word_right()
    repeat(number_small - 1)
select left <number_small> characters:
    edit.extend_left()
    repeat(number_small - 1)
select right <number_small> characters:
    edit.extend_right()
    repeat(number_small - 1)
clear left <number_small> words:
    edit.extend_word_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> words:
    edit.extend_word_right()
    repeat(number_small - 1)
    edit.delete()
clear left <number_small> characters:
    edit.extend_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> characters:
    edit.extend_right()
    repeat(number_small - 1)
    edit.delete()
formatted <user.format_text>:
    user.auto_format_pause()
    auto_insert(format_text)
    user.auto_format_resume()
^format selection <user.formatters>$:
    edit.copy()
    sleep(100ms)
    text = clip.text()
    result = user.formatted_text(text, formatters)
    user.auto_format_pause()
    auto_insert(result)
    user.auto_format_resume()
scratch that: user.clear_last_utterance()
spell that <user.formatters> <user.letters>:
    result = dictate.join_words(user.letters, "")
    result = user.formatted_text(result, formatters)
    user.auto_format_pause()
    auto_insert(result)
    user.auto_format_resume()
spell that <user.letters>:
    result = dictate.join_words(user.letters, "")
    auto_insert(result)
delete: key(backspace)
