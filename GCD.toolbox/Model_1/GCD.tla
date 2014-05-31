-------------------------------- MODULE GCD --------------------------------
EXTENDS Integers
Divides(p, n) == \E q \in Int : n = q * p
DivisorsOf(n) == {p \in Int : Divides(p, n)}
SetMax(S) == 
    CHOOSE i \in S : \A j \in S : i >= j
GCD(m, n) ==
   SetMax(DivisorsOf(m) \cap DivisorsOf(n))


=============================================================================
\* Modification History
\* Last modified Sat May 31 15:44:21 CST 2014 by jing
\* Created Sat May 31 09:50:23 CST 2014 by jing
