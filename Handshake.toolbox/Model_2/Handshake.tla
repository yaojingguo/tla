----------------------------- MODULE Handshake -----------------------------
EXTENDS Integers, Sequences

Put(s) == Append(s, "widget")
Get(s) == Tail(s)

a (+) b == (a + b) % 2

(***************************************************************************
--algorithm Handshake {
 variables p = 0, c = 0, box = << >>;
 fair process ( Producer = 0 )
   { p1: while (TRUE)
          {     await p =  c;
            p2: box := Put(box);
                p := p (+) 1
           }
   }
 fair process ( Consumer = 1 )
   { c1: while (TRUE)
          {     await p # c;
            c2: box := Get(box);
                c := c (+) 1
          }
   }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES p, c, box, pc

vars == << p, c, box, pc >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ p = 0
        /\ c = 0
        /\ box = << >>
        /\ pc = [self \in ProcSet |-> CASE self = 0 -> "p1"
                                        [] self = 1 -> "c1"]

p1 == /\ pc[0] = "p1"
      /\ p =  c
      /\ pc' = [pc EXCEPT ![0] = "p2"]
      /\ UNCHANGED << p, c, box >>

p2 == /\ pc[0] = "p2"
      /\ box' = Put(box)
      /\ p' = p (+) 1
      /\ pc' = [pc EXCEPT ![0] = "p1"]
      /\ c' = c

Producer == p1 \/ p2

c1 == /\ pc[1] = "c1"
      /\ p # c
      /\ pc' = [pc EXCEPT ![1] = "c2"]
      /\ UNCHANGED << p, c, box >>

c2 == /\ pc[1] = "c2"
      /\ box' = Get(box)
      /\ c' = c (+) 1
      /\ pc' = [pc EXCEPT ![1] = "c1"]
      /\ p' = p

Consumer == c1 \/ c2

Next == Producer \/ Consumer

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Producer)
        /\ WF_vars(Consumer)

\* END TRANSLATION
A == INSTANCE Alternation WITH b <- p (+) c, box <- box
=============================================================================
\* Modification History
\* Last modified Thu Jun 05 15:37:54 CST 2014 by yaojingguo
\* Created Thu Jun 05 09:49:40 CST 2014 by yaojingguo
