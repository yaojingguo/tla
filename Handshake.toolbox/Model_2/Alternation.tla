---------------------------- MODULE Alternation ----------------------------
EXTENDS Sequences

Put(s) == Append(s, "widget")
Get(s) == Tail(s)

(***************************************************************************
--algorithm Alternate {

    variable b = 0, box = << >>;
    
    process (Producer = 0)
      { p1: while (TRUE)
              { await b = 0;
                box := Put(box);
                b := 1
              }
      }
      
    fair process (Consumer = 1)
      { c1: while (TRUE)
              { await b = 1;
                box := Get(box);
                b := 0
              }
      }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES b, box

vars == << b, box >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ b = 0
        /\ box = << >>

Producer == /\ b = 0
            /\ box' = Put(box)
            /\ b' = 1

Consumer == /\ b = 1
            /\ box' = Get(box)
            /\ b' = 0

Next == Producer \/ Consumer

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Consumer)

\* END TRANSLATION
=============================================================================
\* Modification History
\* Last modified Fri Jun 06 10:51:27 CST 2014 by yaojingguo
\* Created Wed Jun 04 18:06:04 CST 2014 by yaojingguo
