# Doc : http://users.ece.utexas.edu/~patt/06s.382N/tutorial/espresso_manual.html

ESPRESSO=$(PWD)/espresso-logic/bin/espresso -eeat -Dexact
IN=ATF1502A.pla

go:
	$(ESPRESSO) -o eqntott $(IN) | sed '/^$$/d' | tee $(IN).out

others:
	$(ESPRESSO) $(IN) | tee $(IN).out2
	$(ESPRESSO) -Dso $(IN) | tee $(IN).out3

get-espresso:
	git clone https://github.com/classabbyamp/espresso-logic.git

compile-espresso:
	cd espresso-logic/espresso-src && make

test-espresso:
	$(ESPRESSO) espresso-logic/examples/alu1 

man-espresso:
	nroff -man espresso-logic/man/espresso.1  | less

man2-espresso:
	nroff -man espresso-logic/man/espresso.5  | less
