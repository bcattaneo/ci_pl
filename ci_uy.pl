% Checks whether a 8-digit C.I. is valid or not (check digit included)
checkCi(Ci) :- nonvar(Ci),
    Dig is (Ci mod 10),
    NCi is (Ci div 10),
    genCiDigit(NCi, GenDig),
    Dig =:= GenDig.

% Generates a check digit for a 7-digit C.I.
genCiDigit(Ci, Dig) :- nonvar(Ci), var(Dig),
    genDigitSum(Ci, Sum),
    nextHigherSum(Sum, HSum),
    Dig is (HSum - Sum).

% Generate sum of CI digit
% E.g.: 1234567 -> 1*2+2*9+3*8+4*7+5*6+6*3+7*4 = 148
genDigitSum(0, 0).
genDigitSum(N, Sum) :- nonvar(N), N > 0,
    Dig is (N mod 10),
    NextN is (N div 10),
    digits(N, CurrDig),
    digProd(CurrDig, ProdDig),
    genDigitSum(NextN, NextSum),
    Sum is ((Dig * ProdDig) + NextSum).

% Get next higher value for sum of digits
nextHigherSum(Sum, Next) :- Dig is (10 - (Sum mod 10)),
    Dig < 10, Next is (Sum + Dig).
nextHigherSum(Sum, Sum) :- Dig is (10 - (Sum mod 10)),
    Dig >= 10.

% Get digits count of an integer
digits(0, 0).
digits(Int, Count) :- Int > 0,
    NextInt is (Int div 10),
    digits(NextInt, NextCount),
    Count is (NextCount + 1).

% Prod values for each digit
digProd(0, 1).
digProd(1, 2).
digProd(2, 9).
digProd(3, 8).
digProd(4, 7).
digProd(5, 6).
digProd(6, 3).
digProd(7, 4).