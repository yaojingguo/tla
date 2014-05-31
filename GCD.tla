-------------------------------- MODULE GCD --------------------------------
EXTENDS Integers

Divides(p, n) ==              (**********************************)                 
      \E q \in Int :          (* For integers p and n, equals   *)
              n = q * p       (* TRUE iff p divides n -- which  *)
                              (* I think is really neat; don't  *)
                              (* you?                           *)

DivisorsOf(n) == {p \in Int : Divides(p, n)}
SetMax(S) == 
    CHOOSE i \in S : \A j \in S : i >= j
(* This is all (* commented *) text *)
GCD(m, n) ==
   SetMax(DivisorsOf(m) \cap DivisorsOf(n))


=============================================================================
\* Modification History
\* Last modified Sat May 31 15:55:06 CST 2014 by jing
\* Created Sat May 31 09:50:23 CST 2014 by jing
