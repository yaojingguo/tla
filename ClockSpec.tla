----------------------------- MODULE ClockSpec -----------------------------
EXTENDS Integers
CONSTANT N
ASSUME (N \in Nat) /\ (N > 1)
(***************************************************************************
--algorithm ClockSpec {
  variable c = 0;
  
  process (Tick \in 0..(N-1))
    { t: while (TRUE)
          { await c = self ;
            c := (c + 1) % N
          }
     }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLE c

vars == << c >>

ProcSet == (0..(N-1))

Init == (* Global variables *)
        /\ c = 0

Tick(self) == /\ c = self
              /\ c' = (c + 1) % N

Next == (\E self \in 0..(N-1): Tick(self))

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Sat Jun 07 08:37:57 CST 2014 by yaojingguo
\* Created Sat Jun 07 08:31:09 CST 2014 by yaojingguo
