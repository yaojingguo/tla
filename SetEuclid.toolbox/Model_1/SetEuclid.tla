----------------------------- MODULE SetEuclid -----------------------------
EXTENDS Integers, GCD, FiniteSets

(***************************************************************************
--fair algorithm SetEuclid {
 variables S = {2, 4, 6};
 { while (Cardinality(S) > 1) { with ( x \in S, y \in { s \in S : s > x} )
                                  { S := (S \ {y}) \cup { y - x } }
                              }; 
 }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES S, pc

vars == << S, pc >>

Init == (* Global variables *)
        /\ S = {2, 4, 6}
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF Cardinality(S) > 1
               THEN /\ \E x \in S:
                         \E y \in { s \in S : s > x}:
                           S' = ((S \ {y}) \cup { y - x })
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ S' = S

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION


=============================================================================
\* Modification History
\* Last modified Wed Jun 04 10:56:57 CST 2014 by yaojingguo
\* Created Wed Jun 04 10:23:24 CST 2014 by yaojingguo
