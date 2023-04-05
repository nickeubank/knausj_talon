#(jay son | jason ): "json"
#(http | htp): "http"
#tls: "tls"
#M D five: "md5"
#word (regex | rejex): "regex"
#word queue: "queue"
#word eye: "eye"
#word iter: "iter"
#word no: "NULL"
#word cmd: "cmd"
#word dup: "dup"
#word shell: "shell".
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()
scroll up: edit.page_up()
scroll down: edit.page_down()
copy that: edit.copy()
cut that: edit.cut()
paste that: edit.paste()
undo that: edit.undo()
redo that: edit.redo()
paste match: edit.paste_match_style()
file save: edit.save()
wipe: key(backspace)
scratch: key(backspace)
scratch that: key(backspace)
(pad | padding): 
	insert("  ") 
	key(left)
slap:
	key(enter)
volume up: key(volup)
volume down: key(voldown)
mute: key(mute)
play next: key(next)
play previous: key(prev)
(play | pause): key(play_pause)
wipe: key(backspace)
(pad | padding):
	insert("  ")
	key(left)
funny: "ha ha"
#menu: key(alt)

# Nick Navigation Helpers
star: edit.word_right()
port:edit.word_left() 
star hard: edit.line_end()
port hard:edit.line_start() 


select star hard:
	key('cmd-shift-right')
select port hard:
	key('cmd-shift-left')
select port:
	key('alt-shift-left')
select star: 
	key('alt-shift-right')

# Jupyter and Global Code Running
run that:
	key(shift-enter)
execute:
	key(shift-enter)
run to here:
	key(alt-shift-enter)
execute to here:
	key(alt-shift-enter)
execute file:
	key(cmd-shift-enter)
desk right:
	key(ctrl-right)
desk left:
	key(ctrl-left)
run new:
	key(alt-enter)
execute new:
	key(alt-enter)
execute all:
	key(cmd-shift-enter)
delete cell: "dd"
split cell:
	key(ctrl-shift--)
restart kernel:
	key(cmd-ctrl-r)

email address: "nick@nickeubank.com"
phone number: "3039186528"
zoom link: "https://duke.zoom.us/my/nickeubank"
screenshot:
	key(cmd-shift-4)

emdash: user.paste("—")
end dash: user.paste("—")

thumbs up: user.paste("👍️️")
facepalm: user.paste("🤦‍♂️")
shrug: user.paste("🤷‍♂️")
:-): user.paste("🙂")
laughing: user.paste("🤣")
angry: user.paste("🤬")

emoji keyboard:
	key(cmd-ctrl-space)

# alpha: user.paste("α")
# beta: user.paste("β")
# gamma: user.paste("γ")
# delta: user.paste("δ")
# epsilon: user.paste("ϵ")
# mu: user.paste("μ")
# pi: user.paste("π")
# sigma: user.paste("σ")
# tau: user.paste("τ")

highlight that:
	key(cmd-ctrl-h)

egg:
	insert("(e.g., )")
	key(left)

sausage:
	insert("(i.e., )")
	key(left)
