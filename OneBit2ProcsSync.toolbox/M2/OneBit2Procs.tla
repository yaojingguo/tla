---------------------------- MODULE OneBit2Procs ----------------------------
EXTENDS Integers

(***************************************************************************
--algorithm OneBit {
   variable x = [i \in {0,1} |-> FALSE] ;
   fair process (P \in {0,1})
    { ncs: while (TRUE)
             {      skip;
               e1:  x[self] := TRUE ;
               e2:  if (~x[1-self]) { cs: skip }
                    else { if (self = 0) { goto e2 }
                           else { e3: x[1] := FALSE ;
                                  e4: while (x[0]) { skip };
                                      goto e1
                                }
                         };
               f:   x[self] := FALSE
             }
    }          
 }

 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES x, pc

vars == << x, pc >>

ProcSet == ({0,1})

Init == (* Global variables *)
        /\ x = [i \in {0,1} |-> FALSE]
        /\ pc = [self \in ProcSet |-> "ncs"]

ncs(self) == /\ pc[self] = "ncs"
             /\ TRUE
             /\ pc' = [pc EXCEPT ![self] = "e1"]
             /\ x' = x

e1(self) == /\ pc[self] = "e1"
            /\ x' = [x EXCEPT ![self] = TRUE]
            /\ pc' = [pc EXCEPT ![self] = "e2"]

e2(self) == /\ pc[self] = "e2"
            /\ IF ~x[1-self]
                  THEN /\ pc' = [pc EXCEPT ![self] = "cs"]
                  ELSE /\ IF self = 0
                             THEN /\ pc' = [pc EXCEPT ![self] = "e2"]
                             ELSE /\ pc' = [pc EXCEPT ![self] = "e3"]
            /\ x' = x

cs(self) == /\ pc[self] = "cs"
            /\ TRUE
            /\ pc' = [pc EXCEPT ![self] = "f"]
            /\ x' = x

e3(self) == /\ pc[self] = "e3"
            /\ x' = [x EXCEPT ![1] = FALSE]
            /\ pc' = [pc EXCEPT ![self] = "e4"]

e4(self) == /\ pc[self] = "e4"
            /\ IF x[0]
                  THEN /\ TRUE
                       /\ pc' = [pc EXCEPT ![self] = "e4"]
                  ELSE /\ pc' = [pc EXCEPT ![self] = "e1"]
            /\ x' = x

f(self) == /\ pc[self] = "f"
           /\ x' = [x EXCEPT ![self] = FALSE]
           /\ pc' = [pc EXCEPT ![self] = "ncs"]

P(self) == ncs(self) \/ e1(self) \/ e2(self) \/ cs(self) \/ e3(self)
              \/ e4(self) \/ f(self)

Next == (\E self \in {0,1}: P(self))

Spec == /\ Init /\ [][Next]_vars
        /\ \A self \in {0,1} : WF_vars(P(self))

\* END TRANSLATION
InCS(i) == pc[i] = "cs"
MutualExclusion == ~(InCS(0) /\ InCS(1))
pcBar == [i \in {0,1} |-> IF pc[i] \in {"ncs","f", "e3", "e4"} THEN "r"
                                                   ELSE pc[i]]
A == INSTANCE OneBitProtocol WITH x <- x,
                                  pc <- pcBar
Trying(i) == pc[i] \in IF i = 0 THEN {"e1", "e2"}
                                ELSE {"e1","e2","e3","e4"}
DeadlockFree == (Trying(0) \/ Trying(1)) ~> (InCS(0)\/InCS(1))
\* Other == INSTANCE OneBit2ProcsSync WITH x <- x, pc <- pc

=============================================================================
\* Modification History
\* Last modified Sat Jun 07 17:10:32 CST 2014 by yaojingguo
\* Created Sat Jun 07 15:15:55 CST 2014 by yaojingguo
