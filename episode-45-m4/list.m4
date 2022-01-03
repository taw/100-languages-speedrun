define(`startlist',`define(`listcounter',1)')dnl
define(`nextlistcounter',`define(`listcounter',eval(1+listcounter))')dnl)
define(`item', `* listcounter. $1 nextlistcounter')dnl
Most popular animals:
startlist
item(Cats)
item(Dogs)
item(Fish for some reason, boring)
item(Birds)
item(Rabbits)
