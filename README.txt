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

After that, simply execute the "imaginary-landscape-5" file. You can click on it, and ask to execute it in a terminal, or do it via command line:

      $ /path/to/imaginary-landscape-5/imaginary-landscape-5.sh

You may want to record what you will be playing. In this case, use the "imaginary-landscape-5-record.sh" instead. Notice that this needs more processing, and may take some time to initialize (in my computer, it took 30 seconds).


This script is designed for GNU/linux.

To run it, you will need Supercollider, jack and sox.
If you have not downloaded them, or don't know wheter you did or not,
run the following command on root mode (valid for debian-based distros):

    # apt-get install supercollider jackd sox libsox-fmt-mp3



OTHER CHARACTERISTICS

The script will read the files in "files/" alphabetically, and use them in order of appearence in the song.

The script "imaginary-landscape-5-record" will record its result to a file called "record.wav". Each time you call it it will overwrite this file. If you are going to use new files, don't forget to copy the old record elsewhere, or simply with another name. 

They will also change some things with the files you provide (it will convert all mp3 files to wav files and convert mono files to stereo). The original files wil have been copied to the "backup/" folder. If you provide it with a lot of mp3 files and mono files it will take him some time to arrange everything.

The backup system of this script is not very intelligent. It will copy again and overwrite all the files you have already backed up, every time you call the script. If you don't want to spend CPU with this, open the "imaginary-landscape-5" file and erase the following line: 

	cp -v ${SCRIPT_DIR}/files/* ${SCRIPT_DIR}/backup/

Consider doing the same with imaginary-landscape-5-record.


