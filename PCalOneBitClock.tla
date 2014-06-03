-------------------------- MODULE PCalOneBitClock --------------------------
(***************************************************************************
--algorithm Clock {
   variable b \in {0, 1};
   { while (TRUE) { if (b  = 0) b := 1 else b := 0
                       }
   }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLE b

vars == << b >>

Init == (* Global variables *)
        /\ b \in {0, 1}

Next == IF b  = 0
           THEN /\ b' = 1
           ELSE /\ b' = 0

Spec == Init /\ [][Next]_vars

\* END TRANSLATION
=============================================================================
\* Modification History
\* Last modified Thu May 29 15:14:15 CST 2014 by yaojingguo
\* Created Thu May 29 15:08:52 CST 2014 by yaojingguo
