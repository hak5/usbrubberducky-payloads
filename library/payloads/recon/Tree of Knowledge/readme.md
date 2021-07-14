# Tree of Knowledge

## Intro
This payload copies the names of all the files on a victims PC then puts them on a file on the root of the ducky.
In order to remove suspicion, the ducky also automatically hides the gathered recon info so that it can only be seen when the batch file is run.
This whole process is relatively discreet, bug free and can run and finish in a matter of seconds.
This payload is great for the first phase of a Pen Test, since it effortlessly shows you the contents of a victims PC, which can then later be used for an "involuntary backup".

## Requirements:
- Only works on Windows (7/8/8.1/10)
- Twin Duck firmware must be loaded
- The ducky must be labeled as "USB"

## Viewing files
In order to view the gathered recon file(s), simply put the show.bat program onto the root of the ducky and run it.

## Bonus
I have used a "bat to exe" converter in order to convert the batch file into a program disguised as Bing. That way the batch file can remain on the root of the ducky, while still being discreet.
Another tip that I have learned is that the inject.bin still works even if it is marked as "hidden".

That's it folks!
I spent quite long in order optimise this payload, so enjoy! 