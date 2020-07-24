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
push: edit.word_right()
pull:edit.word_left() 
jump: edit.line_end()
jump left:edit.line_start() 


select jump:
	key('cmd-shift-right')
select jump left:
	key('cmd-shift-left')
select pull: 
	key('alt-shift-left')
select push: 
	key('alt-shift-right')

run that:
	key(shift-enter)
run to here:
	key(alt-shift-enter)
run file:
	key(cmd-shift-enter)
screen right:
	key(ctrl-right)
screen left:
	key(ctrl-left)

run new:
	key(alt-enter)


e-mail address: "nick@nickeubank.com"
zoom link: "https://duke.zoom.us/my/nickeubank"
screenshot:
	key(cmd-shift-4)

thumbs up: user.paste("👍️️")
facepalm: user.paste("🤦‍♂️")

