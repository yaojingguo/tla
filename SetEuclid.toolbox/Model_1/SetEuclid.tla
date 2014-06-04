----------------------------- MODULE SetEuclid -----------------------------
EXTENDS Integers, GCD, FiniteSets

RECURSIVE SetSum(_)
SetSum(T) == IF T = {} THEN 0
                       ELSE LET t == CHOOSE x \in T : TRUE
                            IN  t + SetSum(T \ {t})

(***************************************************************************
--fair algorithm SetEuclid {
 variables Input = {2, 4, 6}, S = Input;
 { while (Cardinality(S) > 1) { with ( x \in S, y \in { s \in S : s > x} )
                                  { S := (S \ {y}) \cup { y - x } }
                              }; 
 }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES Input, S, pc

vars == << Input, S, pc >>

Init == (* Global variables *)
        /\ Input = {2, 4, 6}
        /\ S = Input
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF Cardinality(S) > 1
               THEN /\ \E x \in S:
                         \E y \in { s \in S : s > x}:
                           S' = ((S \ {y}) \cup { y - x })
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ S' = S
         /\ Input' = Input

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION


=============================================================================
\* Modification History
\* Last modified Wed Jun 04 11:36:54 CST 2014 by yaojingguo
\* Created Wed Jun 04 10:23:24 CST 2014 by yaojingguo
