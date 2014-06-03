------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD
CONSTANTS M, N

ASSUME /\ M \in Nat \ {0}
        /\ N \in Nat \ {0}
(***************************************************************************
--algorithm Euclid {
 variables x = M, y = N;
 { while (x # y) { if (x < y) { y := y - x }
                   else       { x := x - y }
                 };
 }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES x, y, pc

vars == << x, y, pc >>

PartialCorrectness ==
  (pc = "Done") => (x = y) /\ (x = GCD(M, N))
  
Init == (* Global variables *)
        /\ x = M
        /\ y = N
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF x # y
               THEN /\ IF x < y
                          THEN /\ y' = y - x
                               /\ x' = x
                          ELSE /\ x' = x - y
                               /\ y' = y
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ UNCHANGED << x, y >>

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Tue Jun 03 11:00:10 CST 2014 by yaojingguo
\* Last modified Sat May 31 17:16:19 CST 2014 by jing
\* Created Sat May 31 16:03:52 CST 2014 by jing
