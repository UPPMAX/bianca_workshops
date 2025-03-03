#/bin/bash
#
# Play reminders for the course schedule.
#
# Schedule in Markdown for convenient copy-pasting:
#
# | From  | To    | What                           |
# |-------|-------|--------------------------------|
# | 9:00  | 10:00 | .                              |
# | 10:00 | 10:15 | Break                          |
# | 10:15 | 11:00 | .                              |
# | 11:00 | 11:15 | Break                          |
# | 11:15 | 12:00 | .                              |
# | 12:00 | 13:00 | Lunch                          |
# | 13:00 | 13:45 | .                              |
# | 13:45 | 14:00 | Break                          |
# | 14:00 | 14:45 | .                              |
# | 14:45 | 15:00 | Break                          |
# | 15:00 | 15:30 | .                              |
# | 15:30 | 16:00 | Reflection                     |

# 9.00 Introduction
# 9.15 NAISS-Sens
# 9.35 Login using Thinlinc
# 9.55 coffee break
# 10.10 Command line intro specific to Bianca
# 10.55 break
# 11.10 Module system
# 12.00 Lunch

echo 'espeak -s 120 -p 10 "start to work"' | at 9:00
echo 'espeak -s 120 -p 10 "time for NAISS-Sens"' | at 9:15
echo 'espeak -s 120 -p 10 "time for login"' | at 9:35
echo 'espeak -s 120 -p 10 "time to have a break"' | at 9:55
echo 'espeak -s 120 -p 10 "back to work, to command line"' | at 10:10
echo 'espeak -s 120 -p 10 "time to have a break"' | at 10:55
echo 'espeak -s 120 -p 10 "back to work, to modules"' | at 11:10
echo 'espeak -s 120 -p 10 "lunch"' | at 12:00
