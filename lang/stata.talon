mode: user.stata
mode: command
and code.language: stata
-

gen: "gen"
gets: " = "
not equals: " != "
double equals: " == "
greater equal: " >= "
tabulate: "tab "
if: "if"
in list: 
    insert("inlist()")
    edit.left()

drop [<user.text>]:
    insert("drop ")
    insert(user.text or "")
