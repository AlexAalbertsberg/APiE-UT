% Written by Alex Aalbertsberg
% s1008129

% Test bench for exercise 2 using built-in RNG.

rng('default');
vec = rand([1 1]);
avgone = mean(vec);
stdone = std(vec);

rng('default');
vec = rand([10 1]);
avgten = mean(vec);
stdten = std(vec);

rng('default');
vec = rand([100 1]);
avghundred = mean(vec);
stdhundred = std(vec);

rng('default');
vec = rand([1000 1]);
avgthousand = mean(vec);
stdthousand = std(vec);

rng('default');
vec = rand([10000 1]);
avgtenthousand = mean(vec);
stdtenthousand = std(vec);

rng('default');
vec = rand([100000 1]);
avghundredthousand = mean(vec);
stdhundredthousand = std(vec);

rng('default');
vec = rand([1000000 1]);
avgmillion = mean(vec);
stdmillion = std(vec);

rng('default');
vec = rand([10000000 1]);
avgtenmillion = mean(vec);
stdtenmillion = std(vec);