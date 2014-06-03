------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD, TLC
CONSTANTS N
ASSUME /\ N \in Nat \ {0}
        
(***************************************************************************
--fair algorithm Euclid {
 variables x \in 1..N, y \in 1..N, x0 = x, y0 = y;
 { while (x # y) {  if (x < y) { y := y - x }
                           else       { x := x - y }
                      };
   assert (x = y) /\ (x = GCD(x0, y0))                 
 }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES x, y, x0, y0, pc

vars == << x, y, x0, y0, pc >>

Init == (* Global variables *)
        /\ x \in 1..N
        /\ y \in 1..N
        /\ x0 = x
        /\ y0 = y
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF x # y
               THEN /\ IF x < y
                          THEN /\ y' = y - x
                               /\ x' = x
                          ELSE /\ x' = x - y
                               /\ y' = y
                    /\ pc' = "Lbl_1"
               ELSE /\ Assert((x = y) /\ (x = GCD(x0, y0)), 
                              "Failure of assertion at line 12, column 4.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << x, y >>
         /\ UNCHANGED << x0, y0 >>

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Tue Jun 03 15:18:20 CST 2014 by yaojingguo
\* Last modified Tue Jun 03 11:00:10 CST 2014 by yaojingguo
\* Last modified Sat May 31 17:16:19 CST 2014 by jing
\* Created Sat May 31 16:03:52 CST 2014 by jing
