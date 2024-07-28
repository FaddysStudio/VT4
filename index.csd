
<CsoundSynthesizer>

<CsOptions>

;-+rtaudio=coreaudio

;-iadc1

;-odac2

</CsOptions>

<CsInstruments>

sr = 48000
ksmps = 32
nchnls = 6
0dbfs = 1

instr 13, beat

iRate init 1 / abs ( p3 )
p3 *= 1000
SNote strget p4
strset p5, SNote

kLoop metro iRate

if kLoop == 1 then

schedulek 9 + frac ( p1 ), 0, 1, p5, p6, p7

endif

endin

instr 9, playback

SNote strget p4
p3 filelen SNote

aLeft, aRight diskin2 SNote

chnmix aLeft / ( p5 + 1 ), "left"
chnmix aRight / ( p6 + 1 ), "right"

endin

instr 4, record

SPath strget p4
SPath1 strcat SPath, "_1.wav"
SPath2 strcat SPath, "_2.wav"
SPath3 strcat SPath, "_3.wav"

aLeft1, aRight1 inch 1, 2
aLeft2, aRight2 inch 3, 4
aLeft3, aRight3 inch 5, 6

fout SPath1, -1, aLeft1, aRight1
fout SPath2, -1, aLeft2, aRight2
fout SPath3, -1, aLeft3, aRight3

endin

instr out

aLeft chnget "left"
aRight chnget "right"

aLeft clip aLeft, 0, 1
aRight clip aRight, 0, 1

outs aLeft, aRight

chnclear "left"
chnclear "right"

endin

schedule "out", 0, -1

</CsInstruments>

<CsScore>

t 0 105
v 4
i 13.1 [0/8] 1 "equipment/dom/13.wav" 1 0 0
i 13.2 [1/8] 1 "equipment/tak/04.wav" 2 .25 .25
i 13.3 [3/8] 1 "equipment/tak/07.wav" 3 .25 .25
i 13.4 [1/8] 1 "equipment/sagat/004.wav" 4 .5 .5
i 13.5 [3/8] 1 "equipment/sagat/007.wav" 5 .5 .5
i 13.6 [6/8] 1 "equipment/sagat/011.wav" 6 .5 .5
i 13.7 [4/8] 1 "equipment/dom/12.wav" 7 0 0
i 13.8 [6/8] 1 "equipment/clap/3.wav" 8 .35 .35
i 13.9 [2/8] 1 "equipment/clap/2.wav" 9 .35 .35
i 13.11 [5/16] 1 "equipment/sak/00.wav" 11 4 4
i 13.12 [10/16] 1 "equipment/sak/19.wav" 12 4 4
i 13.13 [11/16] 1 "equipment/sak/04.wav" 13 4 4
i 13.14 [14/16] 1 "equipment/sak/15.wav" 14 4 4
i 13.15 [15/16] 1 "equipment/sak/08.wav" 15 4 4
b 4

</CsScore>

</CsoundSynthesizer>
