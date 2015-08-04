GRATR_DIR=~/gratr2
IAL=~/ial
INCLUDES=-i . -i $(GRATR_DIR)/agda -i $(IAL)

main: main.agda stlc-main.agda
	agda $(INCLUDES) -c main.agda

stlc-main: stlc-main.agda
	agda $(INCLUDES) -c stlc-main.agda

stlc-main.agda: stlc.gr
	gratr stlc.gr