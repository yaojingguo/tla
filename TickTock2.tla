----------------------------- MODULE TickTock2 -----------------------------
EXTENDS Integers
(***************************************************************************
--algorithm TickTock2 {
    variable b = 0;
    
    process (TickTock \in {0, 1})
      { t: while (TRUE)
              { await b = self ;
                b := (self + 1) % 2
              }
      }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLE b

vars == << b >>

ProcSet == ({0, 1})

Init == (* Global variables *)
        /\ b = 0

TickTock(self) == /\ b = self
                  /\ b' = (self + 1) % 2

Next == (\E self \in {0, 1}: TickTock(self))

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Sat Jun 07 08:27:58 CST 2014 by yaojingguo
\* Created Sat Jun 07 08:25:45 CST 2014 by yaojingguo
