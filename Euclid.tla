------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD, TLC
CONSTANTS M, N
ASSUME /\ M \in Nat \ {0}
       /\ N \in Nat \ {0}
        
(***************************************************************************
--fair algorithm Euclid {
 variables x = M, y = N;
 { abc: while (x # y) { d: if (x < y) { y := y - x }
                           else         { x := x - y }
                      };              
 }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES x, y, pc

vars == << x, y, pc >>

Init == (* Global variables *)
        /\ x = M
        /\ y = N
        /\ pc = "abc"

abc == /\ pc = "abc"
       /\ IF x # y
             THEN /\ pc' = "d"
             ELSE /\ pc' = "Done"
       /\ UNCHANGED << x, y >>

d == /\ pc = "d"
     /\ IF x < y
           THEN /\ y' = y - x
                /\ x' = x
           ELSE /\ x' = x - y
                /\ y' = y
     /\ pc' = "abc"

Next == abc \/ d
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Tue Jun 03 16:21:26 CST 2014 by yaojingguo
\* Last modified Tue Jun 03 11:00:10 CST 2014 by yaojingguo
\* Last modified Sat May 31 17:16:19 CST 2014 by jing
\* Created Sat May 31 16:03:52 CST 2014 by jing
