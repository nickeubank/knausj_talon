app: arc
-
tag(): browser
tag(): user.tabs
tab search:
    browser.focus_address()
    insert("% ")
tab search <user.text>$:
    browser.focus_address()
    insert("% {text}")
    key(down)
    
pallet: key(cmd-shift-p)

please [<user.text>]:
    key(cmd-shift-p)
    sleep(1)
    insert(text or "")


