// Imaginary Landscape Nº 5
// John Cage
// joaoseckler@gmail.com

// Adding the buffers in array ~files
// files should be in ./files/

// This variable sets where the script starts reading from the file. Default is 25.

// From the README file:
// The script will read the files from their start point. If you are providing files that
// are entire songs (from an music album, for example), it is likely that they will have 
// a few seconds of silence in the beginning, which would make some parts of the 
// resulting song not so interesting (particularly the first seconds, that are made out 
// 	of several tiny bits of tape). To fix this, you can change where the script will
//  begin reading the files.

~initial_time = 25;


~readBuffers = {
	Buffer.freeAll;
	~files = Array.new;
	~folder = PathName.new(thisProcess.nowExecutingPath).parentPath++"files/";
	PathName(~folder).entries.do({
		arg path;
		~files = ~files.add(Buffer.read(s, path.fullPath));
	});
};



// SynthDef
(
SynthDef(\play1, {
 	arg out = 0, buf = 0,
	bstart = 0, da = 2,
	ampvar = #[5, 5, 5, 5],
	ampdur = #[2, 2, 2];
	var sig, amp;
	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf), 1, bstart);
	amp =EnvGen.kr(Env.new(
		[
			ampvar[0].linexp(1, 8, 0.1, 1),
			ampvar[1].linexp(1, 8, 0.1, 1),
			ampvar[2].linexp(1, 8, 0.1, 1),
			ampvar[3].linexp(1, 8, 0.1, 1),
		],
		[
			ampdur[0]/5,
			ampdur[1]/5,
			ampdur[2]/5
			//divided by 5 for we are using cage's sheet numbers for the arrays 
		],
		\exp
	), doneAction: da);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
);


//Variables
~createArrays = {
	~buf = Array.newClear(8);
	~ampvar = Array.newClear(8);
	~ampdur = Array.newClear(8);
	~wait = Array.newClear(8);
	~finalwait = Array.newClear(8);
	~ampdur2 = Array.newClear(8);
};


~fillArray0 = {
	var num;
	num = 0;
	~buf[num] =
	[
		0, 0, 0,
		10, 10, 10,
		13, 13, 13,
		15,
		18, 18, 18,
		22, 22, 22, 22,
		27, 27, 27, 27,
		30, 30, 30,
		31, 31, 31, 31,
		36, 41
	];
	~ampvar[num] = [
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[7, 4, 4, 4],
		[7, 4, 4, 4],
		[3, 8, 5, 5],
		[3, 8, 5, 5],
		[3, 8, 5, 5],
		[3, 8, 5, 5],
		[3, 8, 5, 5],
		[4, 4, 4, 4],
		[4, 4, 4, 4],
		[7, 3, 6, 2],
		[7, 3, 6, 2],
		[7, 3, 6, 2],
		[8, 8, 8, 8],
		[8, 8, 8, 8],
		[8, 8, 8, 8],
		[8, 8, 8, 8],
		[8, 8, 8, 8],
		[5, 7, 7, 7],
		[5, 7, 7, 7],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[3, 5, 2, 2],
		[3, 5, 2, 2],
		[6, 3, 3, 3],
		[6, 3, 3, 3]
	];
	~ampdur[num] = [
		[23, 0, 0],
		[14, 0, 0],
		[2.5, 0, 0],
		[23.5, 0, 0],
		[7.5, 0, 0],
		[28, 0, 0],
		[28, 0, 0],		
		[8, 15, 0],
		[8, 7, 0],
		[5, 6, 0],
		[4, 5, 0],
		[21, 7, 0],
		[35, 0, 0],
		[6, 0, 0,],
		[15, 9, 10],
		[10, 7, 13],
		[7, 3, 14],
		[5, 0, 0],
		[5, 0, 0],
		[27, 0, 0],
		[38, 0, 0],
		[8, 0, 0],
		[4, 0, 0],
		[9, 0, 0],
		[2, 0, 0],
		[17, 0, 0],
		[5, 24, 0],
		[16, 23, 0],
		[33, 0, 0],
		[5, 0, 0],	
	];
	~wait[num] = [
		13, 7.5, 2.5, 11, 13.5, 0, 22, 10, 0, 26, 30, 11, 0,
		15, 13, 19, 0, 6, 18, 22, 0, 15, 13, 5, 15, 28, 21, 0, 0, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray1 = {
	var num;
	num = 1;
	~buf[num] =
	[
		1, 1,
		7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
		21, 21, 21, 26, 26, 26, 28, 28, 28,
		29, 29, 29, 29,
		34, 34, 34, 37, 39
	];
	~ampvar[num] = [
		[8, 6, 6, 6],
		[8, 6, 6, 6],
		[8, 6, 6, 6],
		[8, 6, 6, 6],
		[7, 7, 7, 7],
		[7, 7, 7, 7],
		[5, 5, 5, 5],
		[5, 5, 5, 5],
		[5, 5, 5, 5],
		[5, 5, 5, 5],
		[4, 7, 7, 7],
		[4, 7, 7, 7],
		[4, 7, 7, 7],
		[4, 7, 7, 7],
		[5, 5, 5, 5],
		[5, 6, 6, 6],
		[5, 6, 6, 6],
		[5, 6, 6, 6],
		[3, 3, 3, 3],
		[3, 3, 3, 3],
		[3, 3, 3, 3],
		[8, 8, 8, 8],
		[8, 8, 8, 8],
		[8, 8, 8, 8],
		[7, 2, 7, 1],
		[7, 2, 7, 1],
		[7, 2, 7, 1],
		[6, 6, 6, 6],
		[3, 5, 5, 5],
		[3, 5, 5, 5],
		[3, 5, 5, 5],
	];
	~ampdur[num] = [
		[1.5, 0, 0],
		[9, 0, 0],
		[13, 0, 0],
		[11, 0, 0],
		[10, 0, 0],
		[7.5, 0, 0],
		[5, 0, 0],		
		[2, 0, 0],
		[10, 0, 0],
		[24, 0, 0],
		[4, 0, 0],
		[3, 0, 0],
		[34, 0, 0],
		[7, 0, 0,],
		[6, 0, 0],
		[12, 0, 0],
		[11, 0, 0],
		[4, 0, 0],
		[8, 0, 0],
		[15, 0, 0],
		[16, 0, 0],
		[5, 0, 0],
		[29, 0, 0],
		[13, 0, 0],
		[5, 9, 7],
		[2, 2, 3],
		[6, 9, 4],
		[8, 0, 0],
		[11, 0, 0],
		[11, 0, 0],
		[8, 0, 0],
	];
	~wait[num] = [
		3.5, 0, 6, 11, 2.5, 19, 8, 109, 19, 9, 11, 75, 6, 10, 0,
		42, 65, 0, 9, 14, 0, 10, 14, 17, 23, 12, 32, 16, 0, 0, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray2 = {
	var num;
	num = 2;
	~buf[num] =
	[
		6, 6, 9, 9, 9, 17, 17, 17,
		24, 24, 24, 24, 24, 24, 32, 32, 32,
		35, 35, 35, 38
	];
	~ampvar[num] = [
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[5, 4, 4, 4],
		[5, 4, 4, 4],
		[5, 4, 4, 4],
		[7, 8, 1, 1],
		[7, 8, 1, 1],
		[2, 2, 2, 2],
		[2, 2, 2, 2],
		[2, 2, 2, 2],
		[2, 2, 2, 2],
		[2, 4, 8, 8],
		[2, 4, 8, 8],
		[2, 4, 8, 8],
		[7, 7, 7, 7],
		[7, 7, 7, 7],
		[7, 7, 7, 7],
		[6, 2, 8, 1],
		[6, 2, 8, 8],
		[8, 1, 1, 1],
	];
	~ampdur[num] = [
		[1, 0, 0],
		[35, 0, 0],
		[5, 0, 0],
		[8.5, 0, 0],
		[3.5, 0, 0],
		[10, 0, 0],
		[15, 5, 0],
		[16, 10, 0],
		[2, 0, 0],
		[6, 0, 0],
		[8, 0, 0],
		[10, 0, 0],
		[6, 27, 0],
		[8, 11, 0],
		[14, 9, 0],
		[3, 0, 0],
		[3, 0, 0],
		[5, 0, 0],
		[6, 9, 11],
		[5, 5, 0],
		[11, 0, 0],
	];
	~wait[num] = [
		13, 0, 24, 131.5, 25.5, 13, 87, 0, 16, 7, 207, 9, 21,
		0, 8, 8, 13, 13, 16, 0, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray3 = {
	var num;
	num = 3;
	~buf[num] =
	[
		4, 4, 4, 11, 12, 12, 12, 19, 19, 19, 23, 25, 25, 25, 33, 33, 33, 40
	];
	~ampvar[num] = [
		[2, 2, 2, 2],
		[2, 2, 2, 2],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[6, 6, 6, 6],
		[8, 5, 5, 5],
		[8, 5, 5, 5],
		[8, 5, 5, 5],
		[6, 3, 8, 8],
		[6, 3, 8, 8],
		[6, 3, 8, 8],
		[6, 3, 8, 8],
		[6, 3, 8, 8],
		[7, 4, 4, 4],
		[7, 4, 4, 4],
		[3, 3, 3, 3],
		[3, 3, 3, 3],
		[8, 8, 8, 8],	
	];
	~ampdur[num] = [
		[1, 0, 0],
		[7, 0, 0],
		[4, 0, 0],
		[3, 0, 0],
		[11.5, 0, 0],
		[6, 0, 0],
		[28, 0, 0],
		[6, 0, 0],
		[7, 0, 0],
		[2, 5, 0],
		[6, 5, 0],
		[4, 5, 0],
		[3, 4, 0],
		[8, 18, 0],
		[35, 0, 0],
		[20, 0, 0],
		[4, 0, 0],
		[2, 0, 0]	
	];
	~wait[num] = [
		20, 42, 0, 9, 138.5, 16, 5, 72, 22, 0, 0, 14, 315, 0, 39, 8, 0, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray4 = {
	var num;
	num = 4;
	~buf[num] =
	[
		3, 3, 3, 16, 16
	];
	~ampvar[num] = [
		[7, 7, 7, 7],
		[7, 7, 7, 7],
		[7, 7, 7, 7],
		[7, 3, 8, 2],
		[8, 3, 8, 8]	
	];
	~ampdur[num] = [
		[2.5, 0, 0],
		[7.5, 0, 0],
		[12, 0, 0],
		[6, 15, 14],
		[4, 8, 0]
	];
	~wait[num] = [
		18.5, 197.5, 16, 597, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray5 = {
	var num;
	num = 5;
	~buf[num] =
	[
		2, 2, 2, 2, 2, 20
	];
	~ampvar[num] = [
		[5, 5, 5, 5],
		[5, 5, 5, 5],
		[5, 5, 5, 5],
		[4, 2, 6, 6],
		[4, 2, 6, 6],
		[4, 2, 6, 6],
	];
	~ampdur[num] = [
		[1, 0, 0],
		[7, 0, 0],
		[7, 0, 0],
		[4, 4, 0],
		[4, 5, 0],
		[4, 3, 0]		
	];
	~wait[num] = [
		18.5, 211, 28, 12, 0, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray6 = {
	var num;
	num = 6;
	~buf[num] =
	[
		5, 5, 5, 14
	];
	~ampvar[num] = [
		[8, 8, 8, 8],
		[7, 3, 3, 3],
		[7, 3, 3, 3],
		[7, 3, 3, 3],
	];
	~ampdur[num] = [
		[1, 0, 0],
		[4, 0, 0],
		[4, 0, 0],
		[6, 0, 0],
	];
	~wait[num] = [
		25, 192, 10, 0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};

~fillArray7 = {
	var num;
	num = 7;
	~buf[num] =
	[
		7
	];
	~ampvar[num] = [
		[7, 7, 7, 7]
	];
	~ampdur[num] = [
		[7, 0, 0]
	];
	~wait[num] = [
		0
	];
	//~ampdur2 is total time of one synth created (while ~ampdur is an array
	//of arrays containig the times of each amplitude subdivision in one synth)
	~ampdur2[num] = Array.fill(~ampdur[num].size, { arg i; ~ampdur[num][i].sum});
	~finalwait[num] = ~ampdur2[num]+~wait[num];
	~finalwait[num] = ~finalwait[num]/5;
	//divided by 5 for we are using cage's sheet numbers
	// ampdur's division by 5 is at the SynthDef
};




//ROUTINES

(
~rout0 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 0;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout1 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 0;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout2 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 1;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout3 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 3;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout4 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 4;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout5 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 5;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout6 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 6;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

(
~rout7 = Routine {
	var tini, num;
	tini = ~initial_time;
	num = 7;
	do(~buf[num].size, {
		arg index;
		x = Synth(\play1, [
			\buf, ~buf[num][index],
			\ampvar, ~ampvar[num][index],
			\ampdur, ~ampdur[num][index],
			\bstart, (tini*s.sampleRate)/5
		]
		);
		~finalwait[num][index].wait;
		if(
			~buf[num][index] == ~buf[num][index + 1],
			{ tini = tini + ~ampdur2[num][index] },
			{ tini = ~initial_time }
		);
	});	
}
);

~routAll = Routine {
	
	~rout0.play;
	~rout1.play;
	0.1.wait;
	~rout5.play;
	0.1.wait;
	~rout4.play;
	0.2.wait;
	~rout3.play;
	0.1.wait;
	~rout6.play;
	0.1.wait;
	~rout2.play;
	2.8.wait;
	~rout7.play;
	(~finalwait[0].sum+1).wait;
	s.stopRecording;
	1.wait;
	s.quit;
};


s.boot;
s.waitForBoot({
	~readBuffers.value;
	~createArrays.value;
	~fillArray0.value;
	~fillArray1.value;
	~fillArray2.value;
	~fillArray3.value;
	~fillArray4.value;
	~fillArray5.value;
	~fillArray6.value;
	~fillArray7.value;
	~routAll.play;
});

