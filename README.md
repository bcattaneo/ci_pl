# ci_pl

Prolog clauses to validate Uruguayan Identity Documents ("Cédula de identidad uruguaya" or "C.I.").

## Usage:
`checkCi/1` checks whether a 8-digit C.I. is valid or not (check digit included)
```
?- checkCi(12345672).
true .

?- checkCi(12345674).
false.
```

`genCiDigit/2` generates a check digit for a 7-digit C.I.
```
?- genCiDigit(1234567, Dig).
Dig = 2 .
```

## License
Public domain