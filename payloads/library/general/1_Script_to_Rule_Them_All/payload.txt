REM Title: One Script To Rule Them All
REM Author: Korben and UberGuidoZ
REM Description: Attempt to detect OS then run conditional code based on result.
REM Target: Windows, macOS, Linux, iOS, ChromeOS, Android, plus custom OS.
REM Version: 1.6
REM Category: All of them
REM Source: https://github.com/UberGuidoZ/Hak5-USBRubberducky-Payloads

EXTENSION OS_DETECTION_UBER
    REM VERSION 2.0
    REM AUTHOR: Korben and UberGuidoZ

    REM_BLOCK DOCUMENTATION
        USB Rubber Ducky Host OS Detection (moving target, may fall)
        Results may vary greatly depending on a combination of many variables:
         - number of testing stages
         - specific devices and versions tested against
         - number of systems testing for (scope)
         - detection techniques (passive/invisible/active/hybrid)
         - overall speed
         - overall accuracy

        If all you require is Windows vs <any other os> detection, the PASSIVE_WINDOWS_DETECT extension is recommended over this one.

        TARGET:
            DEFAULT - Windows, Mac, Linux
            ADVANCED_DETECTION - Windows, Mac, Linux, iOS, ChromeOS, Android, custom defined OS

        USAGE:
            Call DETECT_OS_UBER() anywhere in your payload after the extension.
            Place this extension and the DETECT_OS_UBER() before you would like to first reference $_OS to execute payload code conditionally.

        FEEDBACK:
            As mentioned above, this a moving target (especially for macOS).
            Please report any issues identifying specific operating systems with as much detail as possible.
            Your feedback will greatly help solidify the robustness of this extension and others based on it.

        DEBUGGING:
            SET DEBUGGING_OUTPUT DEFINE to TRUE, deploy on a target with text editor open for debug output
    END_REM

    REM CONFIGURATION

REM For Debugging (use if troubleshooting or reporting issues):
    DEFINE #DEBUGGING_OUTPUT FALSE
    DEFINE #ADVANCED_DETECTION FALSE

REM Timing fine tuning:
    DEFINE #STARTUP_DELAY 1500
    DEFINE #RESTART_WAIT 1000
    DEFINE #EXECUTE_DELAY 2000
    DEFINE #CONNECT_WAIT 1000
    DEFINE #OS_DETECT_MODE HID
REM Define Apple keyboard to keep macOS happy
    DEFINE #OS_DETECT_VID VID_05AC
    DEFINE #OS_DETECT_PID PID_021E
    DEFINE #WINDOWS_HOST_REQUEST_COUNT 2
    DEFINE #HOST_RESPONSE_TIMEOUT 1000

REM Start DETECT_OS function
    FUNCTION DETECT_OS_UBER()
        $_HOST_CONFIGURATION_REQUEST_COUNT = 0
        ATTACKMODE #OS_DETECT_MODE #OS_DETECT_VID #OS_DETECT_PID
        DELAY #STARTUP_DELAY
        SAVE_HOST_KEYBOARD_LOCK_STATE

REM Debugging if TRUE
        IF_DEFINED_TRUE #DEBUGGING_OUTPUT
            IF_DEFINED_TRUE #ADVANCED_DETECTION
                STRING ADVANCED OS DETECT
            ELSE_DEFINED
                STRING OS DETECT
            END_IF_DEFINED
            ENTER
            STRING test caps
        END_IF_DEFINED

        IF ($_CAPSLOCK_ON == FALSE) THEN
            LED_R
            CAPSLOCK
            DELAY #HOST_RESPONSE_TIMEOUT
        END_IF
        LED_OFF

        IF_DEFINED_TRUE #DEBUGGING_OUTPUT
            ENTER
            STRING test done
        END_IF_DEFINED

        IF $_RECEIVED_HOST_LOCK_LED_REPLY THEN
            IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                ENTER
                STRING received led response
            END_IF_DEFINED
            LED_G
            IF ($_HOST_CONFIGURATION_REQUEST_COUNT > #WINDOWS_HOST_REQUEST_COUNT) THEN
                IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                    ENTER
                    STRING Prediction: Windows
                END_IF_DEFINED
                $_OS = WINDOWS
            ELSE
                IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                    ENTER
                    STRING Prediction: Linux
                END_IF_DEFINED
                $_OS = LINUX
            END_IF
        ELSE
            IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                ENTER
                STRING No LED response
                ENTER
                STRING Prediciton: MacOS
            END_IF_DEFINED
            $_OS = MACOS
        END_IF

        IF_DEFINED_TRUE #ADVANCED_DETECTION
            IF ( $_OS == LINUX ) THEN
                IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                    ENTER
                    STRING Soft reconnect
                END_IF_DEFINED
                ATTACKMODE OFF
                DELAY #RESTART_WAIT
                ATTACKMODE #OS_DETECT_MODE #OS_DETECT_VID #OS_DETECT_PID
                DELAY #CONNECT_WAIT
                IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                    ENTER
                    STRING Reconnected
                END_IF_DEFINED
                IF ($_CAPSLOCK_ON == TRUE) THEN
                    IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                        ENTER
                        STRING Caps LED on
                        ENTER
                        STRING Test numlock
                    END_IF_DEFINED
                    NUMLOCK
                    DELAY #HOST_RESPONSE_TIMEOUT
                    IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                        ENTER
                        STRING Test done
                    END_IF_DEFINED
                    IF ($_NUMLOCK_ON == FALSE) THEN
                        IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                            ENTER
                            STRING No numlock LED
                            ENTER
                            STRING Prediciton: ChromeOS
                        END_IF_DEFINED
                        $_OS = CHROMEOS
                    ELSE
                        IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                            ENTER
                            STRING Numlock LED on
                            ENTER
                            STRING Testing scrolllock
                        END_IF_DEFINED
                        SCROLLLOCK
                        DELAY #HOST_RESPONSE_TIMEOUT
                        IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                            ENTER
                            STRING Test done
                        END_IF_DEFINED
                        IF ($_SCROLLLOCK_ON == TRUE) THEN
                            IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                                ENTER
                                STRING Scrolllock LED on
                                ENTER
                                STRING Prediciton: Android
                            END_IF_DEFINED
                            $_OS = ANDROID
                        ELSE
                            IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                                ENTER
                                STRING No scrolllock reply
                                ENTER
                                STRING Prediction: Linux
                            END_IF_DEFINED
                            $_OS = LINUX
                        END_IF
                    END_IF
                END_IF
            ELSE IF ($_OS == MACOS) THEN
                IF ($_CAPSLOCK_ON == TRUE) THEN
                    IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                        ENTER
                        STRING Caps LED on
                        ENTER
                        STRING Prediction: iOS
                    END_IF_DEFINED
                    $_OS = IOS
                ELSE 
                    IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                        ENTER
                        STRING No caps reply
                        ENTER
                        STRING Prediction: MacOS
                    END_IF_DEFINED
                    $_OS = MACOS
                END_IF
            ELSE IF ($_OS == WINDOWS) THEN
                IF_DEFINED_TRUE #DEBUGGING_OUTPUT
                    ENTER
                    STRING Confident Windows Prediction
                END_IF_DEFINED
                $_OS = WINDOWS
            END_IF
        END_IF_DEFINED

        RESTORE_HOST_KEYBOARD_LOCK_STATE

        IF_DEFINED_TRUE #DEBUGGING_OUTPUT
            ENTER
            STRING OS_DETECT complete
            ENTER
        END_IF_DEFINED
    END_FUNCTION
END_EXTENSION

EXTENSION HELLO_OS_UBER
    REM VERSION 2.0
    REM AUTHOR: Korben and UberGuidoZ

    REM_BLOCK DOCUMENTATION
        USAGE:
            For use with OS_DETECTION_UBERExtension, call HELLO_OS_UBER()
            after DETECT_OS_UBER() prints the OS determination. Make sure
            your custom conditional code is inserted below where commented.
    END_REM

    REM Defining custom $_OS enums if desired
    DEFINE #EXTRA_EXAMPLES FALSE
    DEFINE #SOME_OTHER_OS 6
    DEFINE #ANOTHER_OS 7

    FUNCTION HELLO_OS_UBER() 
        IF ($_OS == WINDOWS) THEN
            REM Windows code starts here
            DELAY 1000
            GUI r
            DELAY 500
            STRINGLN notepad
            DELAY 1000
            STRINGLN Legit DS3 on Windows
            REM Windows code ends here
        ELSE IF ($_OS == MACOS) THEN
            REM macOS code starts here
            DELAY 2000
            GUI SPACE
            DELAY 500
            STRINGLN TextEdit
            STRINGLN Legit DS3 on macOS
            REM macOS code ends here
        ELSE IF ($_OS == LINUX) THEN
            REM Linux code starts here
            DELAY 2000
            CTRL ALT t
            DELAY 100
            STRINGLN nano
            STRINGLN Legit DS3 on Linux
            REM Linux code ends here
        ELSE IF ($_OS == IOS) THEN
            REM iOS code starts here
            REM iOS code ends here
        ELSE IF ($_OS == CHROMEOS) THEN
            REM ChromeOS code starts here
            REM ChromeOS code ends here
        ELSE IF ($_OS == ANDROID) THEN
            REM Android code starts here
            REM Android code ends here
        IF_DEFINED_TRUE #EXTRA_EXAMPLES
            ELSE IF($_OS == #SOME_OTHER_OS) THEN
                REM Custom Other OS code starts here
                REM Custom Other OS code ends here
            ELSE IF($_OS == #ANOTHER_OS) THEN
                REM Another custom Other OS code starts here
                REM Another custom Other OS code ends here
        END_IF_DEFINED
            ELSE
                REM All else fails code starts here
                REM All else fails code ends here
        END_IF
    END_FUNCTION
END_EXTENSION

REM Do the do! Change delay at beginning if desired.

DETECT_OS_UBER()
DELAY #EXECUTE_DELAY
HELLO_OS_UBER()