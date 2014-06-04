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

GCD(m, n) ==
   SetMax(DivisorsOf(m) \cap DivisorsOf(n))

THEOREM GCD1 == \A m \in Nat \ {0} : GCD(m, m) = m
 
THEOREM GCD2 == \A m, n \in Nat \ {0} : GCD(m, n) = GCD(n, m)
 
THEOREM GCD3 == \A m, n \in Nat \ {0} :
                     (n > m) => (GCD(m, n) = GCD(m, n-m))

=============================================================================
\* Modification History
\* Last modified Tue Jun 03 18:18:35 CST 2014 by yaojingguo
\* Last modified Tue Jun 03 18:18:13 CST 2014 by yaojingguo
\* Last modified Sat May 31 15:55:06 CST 2014 by jing
\* Created Sat May 31 09:50:23 CST 2014 by jing
