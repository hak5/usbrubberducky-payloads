# Tree of Knowledge

## Intro
This payload copies the names of all the files on a victim's PC, then puts them on a file on the root of the ducky.
In order to remove suspicion, the ducky also automatically hides the gathered recon info so that it can only be seen when the batch file is run.
This whole process is relatively discreet, bug free and can run and finish in a matter of seconds.
This payload is great for the first phase of a Pen Test, since it effortlessly shows you the contents of a victim's PC, which can then later be used for an "involuntary backup".

## Requirements:
- Only works on Windows (7/8/8.1/10)
- Twin Duck firmware must be loaded
- The ducky must be labeled as "USB"

## Viewing files
In order to view the gathered recon file(s), simply put the show.bat program onto the root of the ducky and run it.

## Troubleshooting
1. Experiment with those delays.
2. Make sure that you don't already have a recon file saved from that computer.
3. ALT SPACE doesn't work on some encoders. Try using the java based encoder.

### Tip
The inject.bin still works even if it is marked as "hidden".

That's it folks!
I spent quite long in order optimise this payload, so enjoy!
