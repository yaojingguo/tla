--------------------------- MODULE OneBitProtocol ---------------------------
EXTENDS Integers
(***************************************************************************
--algorithm OneBitProtocol {
   variable x \in [{0, 1} -> BOOLEAN] ;
   process (P \in {0,1})
    { r: while (TRUE)
          {     either { with (v \in BOOLEAN) { x[self] := v };
                         goto  r
                       }
                 or    skip;
            e1:  x[self] := TRUE;
            e2:  if (~x[1-self]) { cs: skip };
          }
    }
 }
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES x, pc

vars == << x, pc >>

ProcSet == ({0,1})

Init == (* Global variables *)
        /\ x \in [{0, 1} -> BOOLEAN]
        /\ pc = [self \in ProcSet |-> "r"]

r(self) == /\ pc[self] = "r"
           /\ \/ /\ \E v \in BOOLEAN:
                      x' = [x EXCEPT ![self] = v]
                 /\ pc' = [pc EXCEPT ![self] = "r"]
              \/ /\ TRUE
                 /\ pc' = [pc EXCEPT ![self] = "e1"]
                 /\ x' = x

e1(self) == /\ pc[self] = "e1"
            /\ x' = [x EXCEPT ![self] = TRUE]
            /\ pc' = [pc EXCEPT ![self] = "e2"]

e2(self) == /\ pc[self] = "e2"
            /\ IF ~x[1-self]
                  THEN /\ pc' = [pc EXCEPT ![self] = "cs"]
                  ELSE /\ pc' = [pc EXCEPT ![self] = "r"]
            /\ x' = x

cs(self) == /\ pc[self] = "cs"
            /\ TRUE
            /\ pc' = [pc EXCEPT ![self] = "r"]
            /\ x' = x

P(self) == r(self) \/ e1(self) \/ e2(self) \/ cs(self)

Next == (\E self \in {0,1}: P(self))

Spec == Init /\ [][Next]_vars       

\* END TRANSLATION
TypeOK == /\ pc \in [{0,1} -> {"r", "e1", "e2", "cs"}]
          /\ x \in [{0,1} -> BOOLEAN]

InCS(i) == pc[i] ="cs"

MutualExclusion == ~(InCS(0) /\ InCS(1))

Inv == /\ TypeOK  
       /\ MutualExclusion
       /\ \A i \in {0,1} : InCS(i) \/ (pc[i] = "e2") => x[i]
          
=============================================================================
\* Modification History
\* Last modified Sat Jun 07 14:33:44 CST 2014 by yaojingguo
\* Created Sat Jun 07 13:31:30 CST 2014 by yaojingguo
