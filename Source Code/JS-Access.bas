DECLARE SUB add()
DECLARE SUB dis()
DECLARE SUB ser()
DECLARE SUB edit()
DECLARE SUB del()

DECLARE SUB DELAY (duration!)

DECLARE FUNCTION engdate$()
DECLARE FUNCTION engtime$()

DECLARE SUB serbyname()
DECLARE SUB serbycountry()
DECLARE SUB serbyoccupation()
DECLARE SUB serbyphoneno()

_TITLE "JS-Access v3.0.1"
$EXEICON:'JS-Access.ico'
_ICON


CLS
SCREEN _NEWIMAGE(640, 380, 256)
LINE (128, 68)-(522, 297), 10, B
LINE (132, 72)-(518, 293), 10, B
LINE (136, 76)-(514, 289), 10, B
LINE (140, 80)-(510, 285), 10, B
LINE (144, 84)-(506, 281), 10, B
LINE (148, 88)-(502, 277), 10, B

LINE (253, 237)-(394, 258), 15, B
LINE (255, 239)-(392, 256), 15, B

COLOR 15
LOCATE 8, 30
PRINT "WELCOME to JS-Access !"
LOCATE 10, 25
PRINT "A better version of MS-Access :D"
LOCATE 12, 24
PRINT "Made by: Joon Shakya | Class 10 'A'"
LOCATE 14, 30
PRINT "Do you want to proceed?"

a = 1
check:
IF a > 2 THEN
    a = 2
ELSEIF a < 1 THEN
    a = 1
END IF
IF a = 1 THEN
    COLOR 15, 2
    LOCATE 16, 33
    PRINT "   Yes   "
    COLOR 15, 0
    LOCATE 16, 42
    PRINT "   No   "
ELSEIF a = 2 THEN
    COLOR 15, 0
    LOCATE 16, 33
    PRINT "   Yes   "
    COLOR 15, 2
    LOCATE 16, 42
    PRINT "   No   "
    COLOR 15, 0
END IF

DO
    leftclick = 0
    WHILE _MOUSEINPUT
        leftclick = _MOUSEBUTTON(1)
    WEND

    keypress$ = UCASE$(INKEY$)

    IF leftclick = -1 THEN
        IF _MOUSEX >= 256 AND _MOUSEX <= 327 AND _MOUSEY >= 240 AND _MOUSEY <= 256 OR _MOUSEX >= 327 AND _MOUSEX <= 392 AND _MOUSEY >= 240 AND _MOUSEY <= 256 THEN
            DO
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                WEND
            LOOP UNTIL leftclick = 0
            EXIT DO
        END IF
    END IF

    IF keypress$ = CHR$(0) + CHR$(77) THEN
        a = a + 1
        GOTO check
    ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
        a = a - 1
        GOTO check
    END IF

    IF _MOUSEX >= 256 AND _MOUSEX <= 327 AND _MOUSEY >= 240 AND _MOUSEY <= 256 THEN
        a = 1
        GOTO check
    ELSEIF _MOUSEX >= 327 AND _MOUSEX <= 392 AND _MOUSEY >= 240 AND _MOUSEY <= 256 THEN
        a = 2
        GOTO check
    END IF

LOOP UNTIL keypress$ = CHR$(13)

IF a <> 1 THEN END
CLS
SCREEN _NEWIMAGE(480, 320, 32)
FOR i = 1 TO 43
    photono$ = STR$(i)
    lengphoto = LEN(photono$) - 1
    photoseq$ = MID$(photono$, 2, lengphoto)
    seqfile$ = "Titleseq/(" + photoseq$ + ").jpg"
    seqimg = _LOADIMAGE(seqfile$)
    _PUTIMAGE (0, 0), seqimg
    DELAY (0.04)
NEXT i

SLEEP 1

CLS
SCREEN _NEWIMAGE(640, 240, 256)

COLOR 15
LOCATE 6, 28
PRINT "Loading.   0% Completed"
COLOR 8
LINE (68, 110)-(570, 132), 2, B
LINE (70, 112)-(568, 130), 2, B

SHELL "if not exist JS-Access.dat type NUL > JS-Access.dat"
SHELL "del Temporary.dat"

CLS
LINE (68, 110)-(570, 132), 2, B
LINE (70, 112)-(568, 130), 2, B
a = 70
FOR j = 1 TO 9
    perc$ = STR$(j * 10)
    COLOR 15
    IF j MOD 3 = 1 THEN
        LOCATE 6, 28
        PRINT "Loading.   " + perc$ + "% Completed"
    ELSEIF j MOD 3 = 2 THEN
        LOCATE 6, 28
        PRINT "Loading..  " + perc$ + "% Completed"
    ELSEIF j MOD 3 = 0 THEN
        LOCATE 6, 28
        PRINT "Loading... " + perc$ + "% Completed"
    END IF
    LINE (a, 112)-(a + 50, 129), 2, BF
    a = a + 50
    k = 0.005 * j
    DELAY (0.25 - k)
NEXT j

COLOR 15
LOCATE 6, 28
PRINT "    100% Completed         "
COLOR 8
LINE (68, 110)-(570, 132), 2, B
LINE (70, 112)-(568, 130), 2, B
a = 70
FOR k = 1 TO 10
    LINE (a, 112)-(a + 50, 129), 2, BF
    a = a + 50
NEXT k
SLEEP 1

DO
    CLS
    SCREEN 12
    LINE (18, 18)-(622, 462), 10, B
    LINE (20, 20)-(620, 460), 10, B
    LINE (40, 44)-(206, 81), 10, B
    LOCATE 4, 7
    COLOR 15
    PRINT "Date: "; engdate$
    LOCATE 5, 7
    PRINT "Time:"; engtime$
    LINE (128, 138)-(502, 307), 10, B
    LINE (130, 140)-(500, 309), 10, B
    LOCATE 10, 33
    COLOR 15
    PRINT "JS-Access v3.0.1"
    LINE (130, 162)-(500, 162), 10, B
    LINE (130, 164)-(500, 164), 10, B
    LINE (170, 164)-(170, 280), 10, B
    LINE (172, 164)-(172, 280), 10, B

    LINE (130, 281)-(500, 281), 10, B
    LINE (130, 283)-(500, 283), 10, B

    LOCATE 19, 23
    COLOR 15
    PRINT "Choose and press enter to continue"

    LOCATE 12, 19
    PRINT "1."
    LOCATE 13, 19
    PRINT "2."
    LOCATE 14, 19
    PRINT "3."
    LOCATE 15, 19
    PRINT "4."
    LOCATE 16, 19
    PRINT "5."
    LOCATE 17, 19
    PRINT "6."

    a = 1
    check2:
    IF a > 6 THEN
        a = 1
    ELSEIF a < 1 THEN
        a = 6
    END IF
    IF a = 1 THEN

        COLOR 15, 2
        LOCATE 12, 24
        PRINT " Add Records                          "

        COLOR 15, 0
        LOCATE 13, 24
        PRINT " Display Records                      "

        COLOR 15, 0
        LOCATE 14, 24
        PRINT " Search Records                       "

        COLOR 15, 0
        LOCATE 15, 24
        PRINT " Edit Records                         "

        COLOR 15, 0
        LOCATE 16, 24
        PRINT " Delete Records                       "

        COLOR 15, 0
        LOCATE 17, 24
        PRINT " Exit                                 "

    ELSEIF a = 2 THEN
        COLOR 15, 0
        LOCATE 12, 24
        PRINT " Add Records                          "

        COLOR 15, 2
        LOCATE 13, 24
        PRINT " Display Records                      "

        COLOR 15, 0
        LOCATE 14, 24
        PRINT " Search Records                       "

        COLOR 15, 0
        LOCATE 15, 24
        PRINT " Edit Records                         "

        COLOR 15, 0
        LOCATE 16, 24
        PRINT " Delete Records                       "

        COLOR 15, 0
        LOCATE 17, 24
        PRINT " Exit                                 "

    ELSEIF a = 3 THEN
        COLOR 15, 0
        LOCATE 12, 24
        PRINT " Add Records                          "

        COLOR 15, 0
        LOCATE 13, 24
        PRINT " Display Records                      "

        COLOR 15, 2
        LOCATE 14, 24
        PRINT " Search Records                       "

        COLOR 15, 0
        LOCATE 15, 24
        PRINT " Edit Records                         "

        COLOR 15, 0
        LOCATE 16, 24
        PRINT " Delete Records                       "

        COLOR 15, 0
        LOCATE 17, 24
        PRINT " Exit                                 "

    ELSEIF a = 4 THEN
        COLOR 15, 0
        LOCATE 12, 24
        PRINT " Add Records                          "

        COLOR 15, 0
        LOCATE 13, 24
        PRINT " Display Records                      "

        COLOR 15, 0
        LOCATE 14, 24
        PRINT " Search Records                       "

        COLOR 15, 2
        LOCATE 15, 24
        PRINT " Edit Records                         "

        COLOR 15, 0
        LOCATE 16, 24
        PRINT " Delete Records                       "

        COLOR 15, 0
        LOCATE 17, 24
        PRINT " Exit                                 "

    ELSEIF a = 5 THEN
        COLOR 15, 0
        LOCATE 12, 24
        PRINT " Add Records                          "

        COLOR 15, 0
        LOCATE 13, 24
        PRINT " Display Records                      "

        COLOR 15, 0
        LOCATE 14, 24
        PRINT " Search Records                       "

        COLOR 15, 0
        LOCATE 15, 24
        PRINT " Edit Records                         "

        COLOR 15, 2
        LOCATE 16, 24
        PRINT " Delete Records                       "

        COLOR 15, 0
        LOCATE 17, 24
        PRINT " Exit                                 "

    ELSEIF a = 6 THEN

        COLOR 15, 0
        LOCATE 12, 24
        PRINT " Add Records                          "

        COLOR 15, 0
        LOCATE 13, 24
        PRINT " Display Records                      "

        COLOR 15, 0
        LOCATE 14, 24
        PRINT " Search Records                       "

        COLOR 15, 0
        LOCATE 15, 24
        PRINT " Edit Records                         "

        COLOR 15, 0
        LOCATE 16, 24
        PRINT " Delete Records                       "

        COLOR 15, 2
        LOCATE 17, 24
        PRINT " Exit                                 "

        COLOR 15, 0
    END IF

    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 176 AND _MOUSEY <= 191 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 191 AND _MOUSEY <= 208 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 208 AND _MOUSEY <= 224 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 224 AND _MOUSEY <= 240 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 240 AND _MOUSEY <= 255 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 255 AND _MOUSEY <= 271 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(80) THEN
            a = a + 1
            GOTO check2
        ELSEIF keypress$ = CHR$(0) + CHR$(72) THEN
            a = a - 1
            GOTO check2
        END IF

        IF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 176 AND _MOUSEY <= 191 THEN
            a = 1
            GOTO check2
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 191 AND _MOUSEY <= 208 THEN
            a = 2
            GOTO check2
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 208 AND _MOUSEY <= 224 THEN
            a = 3
            GOTO check2
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 224 AND _MOUSEY <= 240 THEN
            a = 4
            GOTO check2
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 240 AND _MOUSEY <= 255 THEN
            a = 5
            GOTO check2
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 255 AND _MOUSEY <= 271 THEN
            a = 6
            GOTO check2
        END IF

    LOOP UNTIL keypress$ = CHR$(13)

    SELECT CASE a
        CASE 1
            CALL add
        CASE 2
            CALL dis
        CASE 3
            CALL ser
        CASE 4
            CALL edit
        CASE 5
            CALL del
    END SELECT

    SCREEN _NEWIMAGE(640, 350, 256)
    CLS
    LINE (128, 74)-(512, 278), 10, B
    LINE (132, 78)-(508, 274), 10, B
    LINE (136, 82)-(504, 270), 10, B
    LINE (140, 86)-(500, 266), 10, B
    LINE (144, 90)-(496, 262), 10, B
    LINE (148, 94)-(492, 258), 10, B
    COLOR 15
    LOCATE 9, 30
    PRINT "What do you want to do?"
    a = 1
    check5:
    IF a > 2 THEN
        a = 2
    ELSEIF a < 1 THEN
        a = 1
    END IF
    IF a = 1 THEN
        COLOR 15, 2
        LOCATE 11, 29
        PRINT "   Return to main menu   "
        COLOR 15, 0
        LOCATE 12, 29
        PRINT "   Exit                  "
    ELSEIF a = 2 THEN
        COLOR 15, 0
        LOCATE 11, 29
        PRINT "   Return to main menu   "
        COLOR 15, 2
        LOCATE 12, 29
        PRINT "   Exit                  "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 224 AND _MOUSEX <= 423 AND _MOUSEY >= 160 AND _MOUSEY <= 175 OR _MOUSEX >= 224 AND _MOUSEX <= 423 AND _MOUSEY >= 176 AND _MOUSEY <= 191 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(80) THEN
            a = a + 1
            GOTO check5
        ELSEIF keypress$ = CHR$(0) + CHR$(72) THEN
            a = a - 1
            GOTO check5
        END IF

        IF _MOUSEX >= 224 AND _MOUSEX <= 423 AND _MOUSEY >= 160 AND _MOUSEY <= 175 THEN
            a = 1
            GOTO check5
        ELSEIF _MOUSEX >= 224 AND _MOUSEX <= 423 AND _MOUSEY >= 176 AND _MOUSEY <= 191 THEN
            a = 2
            GOTO check5
        END IF

    LOOP UNTIL keypress$ = CHR$(13)
LOOP WHILE a = 1
COLOR 15, 0
LOCATE 14, 24
PRINT "Thank you for using this program!!!"
END

FUNCTION engtime$ ()
timehour = VAL(MID$(TIME$, 1, 2))
IF timehour > 12 THEN
    hour = timehour - 12
ELSE
    hour = timehour
END IF
IF timehour >= 12 THEN
    ap$ = "PM"
ELSE
    ap$ = "AM"
END IF
IF timehour = 0 THEN hour = 12
hours$ = STR$(hour)
engtime$ = hours$ + MID$(TIME$, 3, 3) + " " + ap$
END FUNCTION

FUNCTION engdate$ ()

todaymonth$ = MID$(DATE$, 1, 2)
monthno = VAL(todaymonth$)

todaydate$ = MID$(DATE$, 4, 2)
dateno2 = VAL(todaydate$)
dateno = VAL(RIGHT$(todaydate$, 1))

year$ = MID$(DATE$, 7, 4)

SELECT CASE monthno
    CASE 1
        month$ = "Jan"
    CASE 2
        month$ = "Feb"
    CASE 3
        month$ = "Mar"
    CASE 4
        month$ = "Apr"
    CASE 5
        month$ = "May"
    CASE 6
        month$ = "Jun"
    CASE 7
        month$ = "Jul"
    CASE 8
        month$ = "Aug"
    CASE 9
        month$ = "Sep"
    CASE 10
        month$ = "Oct"
    CASE 11
        month$ = "Nov"
    CASE 12
        month$ = "Dec"
END SELECT

IF dateno = 1 THEN
    rank$ = "st"
ELSEIF dateno = 2 THEN
    rank$ = "nd"
ELSEIF dateno = 3 THEN
    rank$ = "rd"
ELSE
    rank$ = "th"
END IF

IF dateno2 = 11 OR dateno2 = 12 OR dateno2 = 13 THEN
    rank$ = "th"
END IF

engdate$ = todaydate$ + rank$ + " " + month$ + " " + year$

END FUNCTION

SUB add
CLS
SCREEN 12
nxt:
a = -1
DO
    OPEN "JS-Access.dat" FOR APPEND AS #1
    a = a + 1
    COLOR 15
    LOCATE 25, 15
    PRINT "          Press enter to go to next field     "
    LOCATE 27, 15
    PRINT "                                              "

    LOCATE 4, 25
    COLOR 15
    PRINT "Enter the following information"
    COLOR 15
    LOCATE 6, 8
    PRINT "Name"
    LOCATE 6, 32
    PRINT "Country"
    LOCATE 6, 47
    PRINT "Occupation"
    LOCATE 6, 62
    PRINT "Phone no."

    LINE (38, 38)-(600, 440), 10, B
    LINE (40, 40)-(598, 438), 10, B

    LINE (40, 70)-(600, 70), 10, B
    LINE (40, 72)-(600, 72), 10, B
    LINE (40, 102)-(600, 102), 10, B
    LINE (40, 104)-(600, 104), 10, B
    LINE (40, 373)-(600, 373), 10, B
    LINE (40, 375)-(600, 375), 10, B
    LINE (40, 405)-(600, 405), 10, B
    LINE (40, 407)-(600, 407), 10, B

    LINE (235, 70)-(237, 373), 10, B
    LINE (355, 70)-(357, 373), 10, B
    LINE (475, 70)-(477, 373), 10, B

    LOCATE 8 + a, 8
    INPUT "", N$
    LOCATE 8 + a, 32
    INPUT "", C$
    LOCATE 8 + a, 47
    INPUT "", O$
    LOCATE 8 + a, 62
    INPUT "", P$
    WRITE #1, N$, C$, O$, P$
    COLOR 2
    LOCATE 25, 20
    PRINT "Your record has been stored successfully"
    COLOR 15
    IF a > 14 THEN
        c = 1
        check4:
        IF c > 2 THEN
            c = 2
        ELSEIF c < 1 THEN
            c = 1
        END IF
        IF c = 1 THEN
            COLOR 15, 2
            LOCATE 27, 22
            PRINT "   Add even more records   "
            COLOR 15, 0
            LOCATE 27, 49
            PRINT "   Exit   "
        ELSEIF c = 2 THEN
            COLOR 15, 0
            LOCATE 27, 22
            PRINT "   Add even more records   "
            COLOR 15, 2
            LOCATE 27, 49
            PRINT "   Exit   "
            COLOR 15, 0
        END IF
        DO
            leftclick = 0
            WHILE _MOUSEINPUT
                leftclick = _MOUSEBUTTON(1)
            WEND

            keypress$ = UCASE$(INKEY$)

            IF leftclick = -1 THEN
                IF _MOUSEX >= 168 AND _MOUSEX <= 383 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 384 AND _MOUSEX <= 463 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                    DO
                        WHILE _MOUSEINPUT
                            leftclick = _MOUSEBUTTON(1)
                        WEND
                    LOOP UNTIL leftclick = 0
                    EXIT DO
                END IF
            END IF

            IF keypress$ = CHR$(0) + CHR$(77) THEN
                c = c + 1
                GOTO check4
            ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
                c = c - 1
                GOTO check4
            END IF

            IF _MOUSEX >= 168 AND _MOUSEX <= 383 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                c = 1
                GOTO check4
            ELSEIF _MOUSEX >= 384 AND _MOUSEX <= 463 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                c = 2
                GOTO check4
            END IF


        LOOP UNTIL keypress$ = CHR$(13)
        IF c = 1 THEN
            CLOSE #1
            CLS
            GOTO nxt
        ELSE
            CLOSE #1
            EXIT DO
        END IF

    END IF
    c = 1
    check3:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 24
        PRINT "   Add more records   "
        COLOR 15, 0
        LOCATE 27, 46
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 24
        PRINT "   Add more records   "
        COLOR 15, 2
        LOCATE 27, 46
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 184 AND _MOUSEX <= 359 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 360 AND _MOUSEX <= 439 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check3
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check3
        END IF

        IF _MOUSEX >= 184 AND _MOUSEX <= 359 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check3
        ELSEIF _MOUSEX >= 360 AND _MOUSEX <= 439 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check3
        END IF

    LOOP UNTIL keypress$ = CHR$(13)
    CLOSE #1
LOOP WHILE c = 1
END SUB

SUB dis
CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
nxt:
COLOR 15
LOCATE 27, 15
PRINT "                                              "

LOCATE 4, 25
COLOR 15
PRINT "These are the available records"
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

IF EOF(1) THEN
    LOCATE 4, 25
    COLOR 15
    PRINT "      There are no records     "
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
    GOTO enddis
END IF

a = -1
DO
    a = a + 1
    INPUT #1, N$, C$, O$, P$
    LOCATE 8 + a, 8
    PRINT N$
    LOCATE 8 + a, 32
    PRINT C$
    LOCATE 8 + a, 47
    PRINT O$
    LOCATE 8 + a, 62
    PRINT P$
LOOP UNTIL EOF(1) OR a = 17
IF NOT EOF(1) THEN
    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 24
        PRINT "   View more records   "
        COLOR 15, 0
        LOCATE 27, 47
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 24
        PRINT "   View more records   "
        COLOR 15, 2
        LOCATE 27, 47
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 184 AND _MOUSEX <= 367 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 368 AND _MOUSEX <= 447 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 184 AND _MOUSEX <= 367 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 368 AND _MOUSEX <= 447 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF

    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
END IF
enddis:
CLOSE #1
END SUB

SUB ser
CLS
SCREEN 12
LINE (18, 18)-(622, 462), 10, B
LINE (20, 20)-(620, 460), 10, B

LINE (128, 138)-(502, 347), 10, B
LINE (130, 140)-(500, 345), 10, B
LOCATE 10, 33
COLOR 15
PRINT "Search Records"

LINE (130, 162)-(500, 162), 10, B
LINE (130, 164)-(500, 164), 10, B
LINE (170, 164)-(170, 280), 10, B
LINE (172, 164)-(172, 280), 10, B

COLOR 15
LOCATE 12, 19
PRINT "1."
LOCATE 13, 19
PRINT "2."
LOCATE 14, 19
PRINT "3."
LOCATE 15, 19
PRINT "4."

LOCATE 17, 19
PRINT "5."

LOCATE 12, 24
PRINT "Name"
LOCATE 13, 24
PRINT "Country"
LOCATE 14, 24
PRINT "Occupation"
LOCATE 15, 24
PRINT "Phone no."

LOCATE 17, 24
PRINT "Exit"

LINE (130, 281)-(500, 281), 10, B
LINE (130, 283)-(500, 283), 10, B
LINE (130, 307)-(500, 307), 10, B
LINE (130, 309)-(500, 309), 10, B
LOCATE 19, 28
COLOR 15
PRINT "Choose category to search"

LOCATE 21, 29
PRINT "Press enter to continue"

a = 1
check6:
IF a > 5 THEN
    a = 1
ELSEIF a < 1 THEN
    a = 5
END IF
IF a = 1 THEN

    COLOR 15, 2
    LOCATE 12, 24
    PRINT " Name                                 "

    COLOR 15, 0
    LOCATE 13, 24
    PRINT " Country                              "

    COLOR 15, 0
    LOCATE 14, 24
    PRINT " Occupation                           "

    COLOR 15, 0
    LOCATE 15, 24
    PRINT " Phone no.                            "

    COLOR 15, 0
    LOCATE 17, 24
    PRINT " Exit                                 "

ELSEIF a = 2 THEN
    COLOR 15, 0
    LOCATE 12, 24
    PRINT " Name                                 "

    COLOR 15, 2
    LOCATE 13, 24
    PRINT " Country                              "

    COLOR 15, 0
    LOCATE 14, 24
    PRINT " Occupation                           "

    COLOR 15, 0
    LOCATE 15, 24
    PRINT " Phone no.                            "

    COLOR 15, 0
    LOCATE 17, 24
    PRINT " Exit                                 "

ELSEIF a = 3 THEN
    COLOR 15, 0
    LOCATE 12, 24
    PRINT " Name                                 "

    COLOR 15, 0
    LOCATE 13, 24
    PRINT " Country                              "

    COLOR 15, 2
    LOCATE 14, 24
    PRINT " Occupation                           "

    COLOR 15, 0
    LOCATE 15, 24
    PRINT " Phone no.                            "

    COLOR 15, 0
    LOCATE 17, 24
    PRINT " Exit                                 "

ELSEIF a = 4 THEN
    COLOR 15, 0
    LOCATE 12, 24
    PRINT " Name                                 "

    COLOR 15, 0
    LOCATE 13, 24
    PRINT " Country                              "

    COLOR 15, 0
    LOCATE 14, 24
    PRINT " Occupation                           "

    COLOR 15, 2
    LOCATE 15, 24
    PRINT " Phone no.                            "

    COLOR 15, 0
    LOCATE 17, 24
    PRINT " Exit                                 "

ELSEIF a = 5 THEN

    COLOR 15, 0
    LOCATE 12, 24
    PRINT " Name                                 "

    COLOR 15, 0
    LOCATE 13, 24
    PRINT " Country                              "

    COLOR 15, 0
    LOCATE 14, 24
    PRINT " Occupation                           "

    COLOR 15, 0
    LOCATE 15, 24
    PRINT " Phone no.                            "

    COLOR 15, 2
    LOCATE 17, 24
    PRINT " Exit                                 "
    COLOR 15, 0
END IF

DO
    leftclick = 0
    WHILE _MOUSEINPUT
        leftclick = _MOUSEBUTTON(1)
    WEND

    keypress$ = UCASE$(INKEY$)

    IF leftclick = -1 THEN
        IF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 176 AND _MOUSEY <= 191 THEN
            DO
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                WEND
            LOOP UNTIL leftclick = 0
            EXIT DO
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 191 AND _MOUSEY <= 208 THEN
            DO
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                WEND
            LOOP UNTIL leftclick = 0
            EXIT DO
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 208 AND _MOUSEY <= 224 THEN
            DO
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                WEND
            LOOP UNTIL leftclick = 0
            EXIT DO
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 224 AND _MOUSEY <= 240 THEN
            DO
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                WEND
            LOOP UNTIL leftclick = 0
            EXIT DO
        ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 255 AND _MOUSEY <= 271 THEN
            DO
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                WEND
            LOOP UNTIL leftclick = 0
            EXIT DO
        END IF
    END IF

    IF keypress$ = CHR$(0) + CHR$(80) THEN
        a = a + 1
        GOTO check6
    ELSEIF keypress$ = CHR$(0) + CHR$(72) THEN
        a = a - 1
        GOTO check6
    END IF

    IF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 176 AND _MOUSEY <= 191 THEN
        a = 1
        GOTO check6
    ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 191 AND _MOUSEY <= 208 THEN
        a = 2
        GOTO check6
    ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 208 AND _MOUSEY <= 224 THEN
        a = 3
        GOTO check6
    ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 224 AND _MOUSEY <= 240 THEN
        a = 4
        GOTO check6
    ELSEIF _MOUSEX >= 185 AND _MOUSEX <= 488 AND _MOUSEY >= 255 AND _MOUSEY <= 271 THEN
        a = 5
        GOTO check6
    END IF

LOOP UNTIL keypress$ = CHR$(13)

SELECT CASE a
    CASE 1
        CALL serbyname
    CASE 2
        CALL serbycountry
    CASE 3
        CALL serbyoccupation
    CASE 4
        CALL serbyphoneno
END SELECT
END SUB

SUB edit
CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
OPEN "Temporary.dat" FOR OUTPUT AS #2
nxt:
COLOR 15
LOCATE 27, 15
PRINT "                                              "

LOCATE 4, 25
COLOR 15
PRINT "These are the available records"
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

IF EOF(1) THEN
    LOCATE 4, 25
    COLOR 15
    PRINT "      There are no records     "
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
    GOTO enddis
END IF

a = -1
DO
    a = a + 1
    b = a + 8

    INPUT #1, N$, C$, O$, P$
    COLOR 10
    LOCATE b, 8
    PRINT N$
    LOCATE b, 32
    PRINT C$
    LOCATE b, 47
    PRINT O$
    LOCATE b, 62
    PRINT P$

    c = 1
    check7:
    IF c > 3 THEN
        c = 3
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 24
        PRINT "   Skip   "
        COLOR 15, 0
        LOCATE 27, 34
        PRINT "   Edit   "
        COLOR 15, 0
        LOCATE 27, 44
        PRINT "   Skip all   "

    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 24
        PRINT "   Skip   "
        COLOR 15, 2
        LOCATE 27, 34
        PRINT "   Edit   "
        COLOR 15, 0
        LOCATE 27, 44
        PRINT "   Skip all   "

    ELSEIF c = 3 THEN
        COLOR 15, 0
        LOCATE 27, 24
        PRINT "   Skip   "
        COLOR 15, 0
        LOCATE 27, 34
        PRINT "   Edit   "
        COLOR 15, 2
        LOCATE 27, 44
        PRINT "   Skip all   "

        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 184 AND _MOUSEX <= 263 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 264 AND _MOUSEX <= 343 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 344 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check7
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check7
        END IF

        IF _MOUSEX >= 184 AND _MOUSEX <= 263 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check7
        ELSEIF _MOUSEX >= 264 AND _MOUSEX <= 343 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check7
        ELSEIF _MOUSEX >= 344 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 3
            GOTO check7
        END IF

    LOOP UNTIL keypress$ = CHR$(13)

    SELECT CASE c
        CASE 2

            LOCATE b, 8
            PRINT "                                                                        "

            LOCATE 27, 15
            PRINT "          Press enter to go to next field               "

            LINE (38, 38)-(600, 440), 10, B
            LINE (40, 40)-(598, 438), 10, B

            LINE (40, 70)-(600, 70), 10, B
            LINE (40, 72)-(600, 72), 10, B
            LINE (40, 102)-(600, 102), 10, B
            LINE (40, 104)-(600, 104), 10, B
            LINE (40, 405)-(600, 405), 10, B
            LINE (40, 407)-(600, 407), 10, B

            LINE (235, 70)-(237, 407), 10, B
            LINE (355, 70)-(357, 407), 10, B
            LINE (475, 70)-(477, 407), 10, B

            LOCATE b, 8
            INPUT "", newN$
            LOCATE b, 32
            INPUT "", newC$
            LOCATE b, 47
            INPUT "", newO$
            LOCATE b, 62
            INPUT "", newP$
            WRITE #2, newN$, newC$, newO$, newP$

        CASE 1

            COLOR 15
            LOCATE b, 8
            PRINT N$
            LOCATE b, 32
            PRINT C$
            LOCATE b, 47
            PRINT O$
            LOCATE b, 62
            PRINT P$
            WRITE #2, N$, C$, O$, P$

        CASE 3
            WRITE #2, N$, C$, O$, P$
            WHILE NOT EOF(1)
                INPUT #1, N$, C$, O$, P$
                WRITE #2, N$, C$, O$, P$
            WEND
            GOTO enddis
    END SELECT

LOOP UNTIL EOF(1) OR a = 17
IF NOT EOF(1) THEN
    LOCATE 27, 24
    PRINT "                                    "
    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 24
        PRINT "   View more records   "
        COLOR 15, 0
        LOCATE 27, 47
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 24
        PRINT "   View more records   "
        COLOR 15, 2
        LOCATE 27, 47
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 184 AND _MOUSEX <= 367 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 368 AND _MOUSEX <= 447 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 184 AND _MOUSEX <= 367 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 368 AND _MOUSEX <= 447 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF
    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 15
    INPUT "Those were all the records. Press enter to continue ", lim$
END IF
enddis:
CLOSE #2
CLOSE #1
KILL "JS-Access.dat"
NAME "Temporary.dat" AS "JS-Access.dat"

END SUB

SUB del
CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
OPEN "Temporary.dat" FOR OUTPUT AS #2
nxt:
COLOR 15
LOCATE 27, 15
PRINT "                                              "

LOCATE 4, 25
COLOR 15
PRINT "These are the available records"
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

IF EOF(1) THEN
    LOCATE 4, 25
    COLOR 15
    PRINT "      There are no records     "
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
    GOTO enddis
END IF

a = -1
DO
    a = a + 1
    b = a + 8

    INPUT #1, N$, C$, O$, P$
    COLOR 10
    LOCATE b, 8
    PRINT N$
    LOCATE b, 32
    PRINT C$
    LOCATE b, 47
    PRINT O$
    LOCATE b, 62
    PRINT P$

    c = 1
    check7:
    IF c > 3 THEN
        c = 3
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 23
        PRINT "   Keep   "
        COLOR 15, 0
        LOCATE 27, 33
        PRINT "   Delete   "
        COLOR 15, 0
        LOCATE 27, 45
        PRINT "   Keep all   "

    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 23
        PRINT "   Keep   "
        COLOR 15, 4
        LOCATE 27, 33
        PRINT "   Delete   "
        COLOR 15, 0
        LOCATE 27, 45
        PRINT "   Keep all   "

    ELSEIF c = 3 THEN
        COLOR 15, 0
        LOCATE 27, 23
        PRINT "   Keep   "
        COLOR 15, 0
        LOCATE 27, 33
        PRINT "   Delete   "
        COLOR 15, 2
        LOCATE 27, 45
        PRINT "   Keep all   "

        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 176 AND _MOUSEX <= 255 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 256 AND _MOUSEX <= 351 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            ELSEIF _MOUSEX >= 352 AND _MOUSEX <= 463 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check7
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check7
        END IF

        IF _MOUSEX >= 176 AND _MOUSEX <= 255 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check7
        ELSEIF _MOUSEX >= 256 AND _MOUSEX <= 351 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check7
        ELSEIF _MOUSEX >= 352 AND _MOUSEX <= 463 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 3
            GOTO check7
        END IF

    LOOP UNTIL keypress$ = CHR$(13)

    SELECT CASE c
        CASE 2

            LOCATE 27, 15
            PRINT "                                                        "
            LOCATE 27, 23
            PRINT "Are you sure?"

            d = 2
            check8:
            IF d > 2 THEN
                d = 2
            ELSEIF d < 1 THEN
                d = 1
            END IF
            IF d = 1 THEN
                COLOR 15, 2
                LOCATE 27, 38
                PRINT "   Yes   "
                COLOR 15, 0
                LOCATE 27, 47
                PRINT "   No   "
            ELSEIF d = 2 THEN
                COLOR 15, 0
                LOCATE 27, 38
                PRINT "   Yes   "
                COLOR 15, 2
                LOCATE 27, 47
                PRINT "   No   "
                COLOR 15, 0
            END IF
            DO
                leftclick = 0
                WHILE _MOUSEINPUT
                    leftclick = _MOUSEBUTTON(1)
                    LOCATE 1, 1
                    PRINT _MOUSEX; _MOUSEY
                WEND

                keypress$ = UCASE$(INKEY$)

                IF leftclick = -1 THEN
                    IF _MOUSEX >= 196 AND _MOUSEX <= 367 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 368 AND _MOUSEX <= 431 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                        DO
                            WHILE _MOUSEINPUT
                                leftclick = _MOUSEBUTTON(1)
                            WEND
                        LOOP UNTIL leftclick = 0
                        EXIT DO
                    END IF
                END IF

                IF keypress$ = CHR$(0) + CHR$(77) THEN
                    d = d + 1
                    GOTO check8
                ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
                    d = d - 1
                    GOTO check8
                END IF

                IF _MOUSEX >= 296 AND _MOUSEX <= 367 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                    d = 1
                    GOTO check8
                ELSEIF _MOUSEX >= 368 AND _MOUSEX <= 431 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                    d = 2
                    GOTO check8
                END IF

            LOOP UNTIL keypress$ = CHR$(13)
            IF d = 1 THEN
                LOCATE b, 8
                PRINT "                                                                        "

                LINE (38, 38)-(600, 440), 10, B
                LINE (40, 40)-(598, 438), 10, B

                LINE (40, 70)-(600, 70), 10, B
                LINE (40, 72)-(600, 72), 10, B
                LINE (40, 102)-(600, 102), 10, B
                LINE (40, 104)-(600, 104), 10, B
                LINE (40, 405)-(600, 405), 10, B
                LINE (40, 407)-(600, 407), 10, B

                LINE (235, 70)-(237, 407), 10, B
                LINE (355, 70)-(357, 407), 10, B
                LINE (475, 70)-(477, 407), 10, B

                a = a - 1
            ELSE

                LOCATE 27, 15
                PRINT "                                                        "

                GOTO check7
            END IF

        CASE 1

            COLOR 15
            LOCATE b, 8
            PRINT N$
            LOCATE b, 32
            PRINT C$
            LOCATE b, 47
            PRINT O$
            LOCATE b, 62
            PRINT P$
            WRITE #2, N$, C$, O$, P$

        CASE 3
            WRITE #2, N$, C$, O$, P$
            WHILE NOT EOF(1)
                INPUT #1, N$, C$, O$, P$
                WRITE #2, N$, C$, O$, P$
            WEND
            GOTO enddis
    END SELECT

LOOP UNTIL EOF(1) OR a = 17
IF NOT EOF(1) THEN
    LOCATE 27, 15
    PRINT "                                                        "

    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 24
        PRINT "   View more records   "
        COLOR 15, 0
        LOCATE 27, 47
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 24
        PRINT "   View more records   "
        COLOR 15, 2
        LOCATE 27, 47
        PRINT "   Exit   "
        COLOR 15, 0
    END IF

    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF
    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 15
    INPUT "Those were all the records. Press enter to continue ", lim$
END IF
enddis:
CLOSE #2
CLOSE #1
KILL "JS-Access.dat"
NAME "Temporary.dat" AS "JS-Access.dat"
END SUB

SUB DELAY (duration AS SINGLE)
tim = TIMER
DO
LOOP UNTIL (TIMER - tim + 86400) - (INT((TIMER - tim + 86400) / 86400) * 86400) > duration
END SUB


SUB serbyname
SCREEN _NEWIMAGE(640, 144, 256)

LINE (38, 38)-(600, 104), 10, B
LINE (40, 40)-(598, 102), 10, B
LINE (38, 72)-(600, 70), 10, B

LOCATE 4, 28
PRINT "Enter the name to search"
LOCATE 6, 8
INPUT "Name: ", serN$

CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
pr = 0
nxt:
CLS

LOCATE 4, 25
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

a = -1
DO
    INPUT #1, N$, C$, O$, P$
    IF UCASE$(serN$) = UCASE$(N$) THEN
        a = a + 1
        LOCATE 8 + a, 8
        PRINT N$
        LOCATE 8 + a, 32
        PRINT C$
        LOCATE 8 + a, 47
        PRINT O$
        LOCATE 8 + a, 62
        PRINT P$
    END IF
LOOP UNTIL EOF(1) OR a = 17

IF a + pr = -1 THEN
    LOCATE 4, 31
    PRINT "Ro such record found   "
ELSEIF a + pr = 0 THEN
    LOCATE 4, 29
    PRINT "1 record found in total"
ELSE
    LOCATE 4, 29
    PRINT a + pr + 1; "records found in total "
END IF

IF NOT EOF(1) THEN
    LOCATE 4, 26
    PRINT 18 + pr; "records found till now    "
    pr = pr + 18

    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 0
        LOCATE 27, 48
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 2
        LOCATE 27, 48
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF

    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
END IF
CLOSE #1
END SUB

SUB serbycountry

SCREEN _NEWIMAGE(640, 144, 256)

LINE (38, 38)-(600, 104), 10, B
LINE (40, 40)-(598, 102), 10, B
LINE (38, 72)-(600, 70), 10, B

LOCATE 4, 23
PRINT "Enter the name of the country to search"
LOCATE 6, 8
INPUT "Country: ", serC$

CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
pr = 0
nxt:
CLS

LOCATE 4, 25
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

a = -1
DO
    INPUT #1, N$, C$, O$, P$
    IF UCASE$(serC$) = UCASE$(C$) THEN
        a = a + 1
        LOCATE 8 + a, 8
        PRINT N$
        LOCATE 8 + a, 32
        PRINT C$
        LOCATE 8 + a, 47
        PRINT O$
        LOCATE 8 + a, 62
        PRINT P$
    END IF
LOOP UNTIL EOF(1) OR a = 17

IF a + pr = -1 THEN
    LOCATE 4, 31
    PRINT "Ro such record found   "
ELSEIF a + pr = 0 THEN
    LOCATE 4, 29
    PRINT "1 record found in total"
ELSE
    LOCATE 4, 29
    PRINT a + pr + 1; "records found in total "
END IF

IF NOT EOF(1) THEN
    LOCATE 4, 26
    PRINT 18 + pr; "records found till now    "
    pr = pr + 18

    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 0
        LOCATE 27, 48
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 2
        LOCATE 27, 48
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF
    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
END IF
CLOSE #1
END SUB

SUB serbyoccupation

SCREEN _NEWIMAGE(640, 144, 256)

LINE (38, 38)-(600, 104), 10, B
LINE (40, 40)-(598, 102), 10, B
LINE (38, 72)-(600, 70), 10, B

LOCATE 4, 26
PRINT "Enter the occupation to search"
LOCATE 6, 8
INPUT "Occupation: ", serO$

CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
pr = 0
nxt:
CLS

LOCATE 4, 25
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

a = -1
DO
    INPUT #1, N$, C$, O$, P$
    IF UCASE$(serO$) = UCASE$(O$) THEN
        a = a + 1
        LOCATE 8 + a, 8
        PRINT N$
        LOCATE 8 + a, 32
        PRINT C$
        LOCATE 8 + a, 47
        PRINT O$
        LOCATE 8 + a, 62
        PRINT P$
    END IF
LOOP UNTIL EOF(1) OR a = 17

IF a + pr = -1 THEN
    LOCATE 4, 31
    PRINT "Ro such record found   "
ELSEIF a + pr = 0 THEN
    LOCATE 4, 29
    PRINT "1 record found in total"
ELSE
    LOCATE 4, 29
    PRINT a + pr + 1; "records found in total "
END IF

IF NOT EOF(1) THEN
    LOCATE 4, 26
    PRINT 18 + pr; "records found till now    "
    pr = pr + 18

    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 0
        LOCATE 27, 48
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 2
        LOCATE 27, 48
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF
    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
END IF
CLOSE #1
END SUB

SUB serbyphoneno

SCREEN _NEWIMAGE(640, 144, 256)

LINE (38, 38)-(600, 104), 10, B
LINE (40, 40)-(598, 102), 10, B
LINE (38, 72)-(600, 70), 10, B

LOCATE 4, 25
PRINT "Enter the phone no. to search"
LOCATE 6, 8
INPUT "Phone no.: ", serP$

CLS
SCREEN 12
OPEN "JS-Access.dat" FOR INPUT AS #1
pr = 0
nxt:
CLS

LOCATE 4, 25
COLOR 15
LOCATE 6, 8
PRINT "Name"
LOCATE 6, 32
PRINT "Country"
LOCATE 6, 47
PRINT "Occupation"
LOCATE 6, 62
PRINT "Phone no."

LINE (38, 38)-(600, 440), 10, B
LINE (40, 40)-(598, 438), 10, B

LINE (40, 70)-(600, 70), 10, B
LINE (40, 72)-(600, 72), 10, B
LINE (40, 102)-(600, 102), 10, B
LINE (40, 104)-(600, 104), 10, B
LINE (40, 405)-(600, 405), 10, B
LINE (40, 407)-(600, 407), 10, B

LINE (235, 70)-(237, 407), 10, B
LINE (355, 70)-(357, 407), 10, B
LINE (475, 70)-(477, 407), 10, B

a = -1
DO
    INPUT #1, N$, C$, O$, P$
    IF UCASE$(serP$) = UCASE$(P$) THEN
        a = a + 1
        LOCATE 8 + a, 8
        PRINT N$
        LOCATE 8 + a, 32
        PRINT C$
        LOCATE 8 + a, 47
        PRINT O$
        LOCATE 8 + a, 62
        PRINT P$
    END IF
LOOP UNTIL EOF(1) OR a = 17

IF a + pr = -1 THEN
    LOCATE 4, 31
    PRINT "Ro such record found   "
ELSEIF a + pr = 0 THEN
    LOCATE 4, 29
    PRINT "1 record found in total"
ELSE
    LOCATE 4, 29
    PRINT a + pr + 1; "records found in total "
END IF
IF NOT EOF(1) THEN
    LOCATE 4, 26
    PRINT 18 + pr; "records found till now    "
    pr = pr + 18

    c = 1
    check4:
    IF c > 2 THEN
        c = 2
    ELSEIF c < 1 THEN
        c = 1
    END IF
    IF c = 1 THEN
        COLOR 15, 2
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 0
        LOCATE 27, 48
        PRINT "   Exit   "
    ELSEIF c = 2 THEN
        COLOR 15, 0
        LOCATE 27, 23
        PRINT "   Search more records   "
        COLOR 15, 2
        LOCATE 27, 48
        PRINT "   Exit   "
        COLOR 15, 0
    END IF
    DO
        leftclick = 0
        WHILE _MOUSEINPUT
            leftclick = _MOUSEBUTTON(1)
        WEND

        keypress$ = UCASE$(INKEY$)

        IF leftclick = -1 THEN
            IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 OR _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
                DO
                    WHILE _MOUSEINPUT
                        leftclick = _MOUSEBUTTON(1)
                    WEND
                LOOP UNTIL leftclick = 0
                EXIT DO
            END IF
        END IF

        IF keypress$ = CHR$(0) + CHR$(77) THEN
            c = c + 1
            GOTO check4
        ELSEIF keypress$ = CHR$(0) + CHR$(75) THEN
            c = c - 1
            GOTO check4
        END IF

        IF _MOUSEX >= 176 AND _MOUSEX <= 375 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 1
            GOTO check4
        ELSEIF _MOUSEX >= 376 AND _MOUSEX <= 455 AND _MOUSEY >= 416 AND _MOUSEY <= 431 THEN
            c = 2
            GOTO check4
        END IF
    LOOP UNTIL keypress$ = CHR$(13)
    IF c = 1 THEN
        CLS
        GOTO nxt
    END IF
ELSE
    LOCATE 27, 18
    INPUT "Press enter to return back to main menu or exit ", lim$
END IF
CLOSE #1
END SUB

