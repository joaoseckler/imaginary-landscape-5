IMAGINARY LANDSCAPE Nº5
John Cage, 1961

For SuperCollider and Bash



Please send error reports, comments, ask for help, etc at
joaoseckler@gmail.com



WHAT IS THIS?

This script follows these instructions (except for the last line):

"This is a score for making a recording on tape, using as material any 42 phonograph records. (It was written for the dance, "Portrait of a Lady", by Jean Erdman. The records used were exculsively jazz.)

Each graph unit equals 3 inches of tape (15 I.P.S) equals 1/5 second. The numbers below outlinded areas refer to amplitude: soft(1) to loud(8); single number = constant amplitude, 2 numbers = cresc. or dim., 3 or more = espressivo. [the black dot] indicates change of record. Begginings and endings of systems (2 on a page) are indicated by dotted lines.

The rythmic structure is 5x5. The large divisions are indicated by vertical lines through the systems. The small divisions are indicated by short vertical lines below the systems followed b a notation (e.g. a³) giving the density of that particular small structural part. At the 4th large structural dividision, there is the sign, M -> I, meaning "Mobility -> Immobility". This refers to the method of composition by means of the I-Ching.

The Record, used in performance, may be tape or disc."
(See imaginary-landscape-sheet.pdf on this folder)



HOW TO USE IT?

The user should fill the "file/" folder with 42 audio files.

    Formats accepted: .mp3, .wav, .flac, and .aiff.

You will probably need to change permissions to make the files executable. You can right-click them - properties - permissions - execute. Easier than that:

	$ chmod u+x /path/to/file

or, to the whole folder:
	
	$ chmod -R u+x /path/to/folder/

After that, simply execute the "imaginary-landscape-5" file. You can click on it, and ask to execute it in a terminal, or do it via command line:

      $ /path/to/imaginary-landscape-5/imaginary-landscape-5.sh

You may want to record what you will be playing. In this case, use the "imaginary-landscape-5-record.sh" instead. Notice that this needs more processing, and may take some time to initialize (in my computer, it took 30 seconds).

REQUIREMENTS

This script is designed for GNU/linux.

To run it, you will need Supercollider, jack and sox.
If you have not downloaded them, or don't know wheter you did or not,
run the following command on root mode (valid for debian-based distros):

    # apt-get install supercollider jackd sox libsox-fmt-mp3



FEATURES/PROBLEMS

The script will read the files in "files/" alphabetically, and use them in order of appearence in the song.

The script "imaginary-landscape-5-record" will record its result to a file called "record.wav". Each time you call it it will overwrite this file. If you are going to use new files, don't forget to copy the old record elsewhere, or simply change it's name. 

It will also change some things with the files you provide (it will convert all mp3 and flac files to wav files and convert mono files to stereo). THE ORIGINAL FILES WILL NOT BE PRESERVED, as we assume the user has a copy of the files he is using elsewhere. Also, if you provide it with a lot of mp3 files and mono files it will take him some time to arrange everything.

The script will read the files from their start point. If you are providing files that are entire songs (from an music album, for example), it is likely that they will have a few seconds of silence in the beginning, which would make some parts of the resulting song not so interesting (particularly the first seconds, that are made out of several tiny bits of tape). To fix this, you can change where the script will begin reading the files. The default starting point is 5 seconds. The following example makes it read from the 10th second onward:

$ sed s/"~initial_time = 25"/"~intial_time = 50"/ </path/to/imaginary-landscape-5/imaginary.scd > eraseme ; mv eraseme /path/to/imaginary.scd

For other starting point, replace 50 (from "tini = 50") for a number five times the number of seconds you desire to be the starting point. 

Consider doing the same with imaginary-record.scd

This command will replace the occurrence of the string "~initial_time = 0" in the script for the string you provide. You can also change that manually.
