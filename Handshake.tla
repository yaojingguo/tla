----------------------------- MODULE Handshake -----------------------------
EXTENDS Integers, Sequences

Put(s) == Append(s, "widget")
Get(s) == Tail(s)

a (+) b == (a + b) % 2

(***************************************************************************
--algorithm Handshake {
 variables p = 0, c = 0, box = << >>;
 fair process ( Producer = 0 )
   { p1:- while (TRUE)
          {     await p =  c;
            p2:- box := Put(box);
            p3: p := p (+) 1
           }
   }
 fair process ( Consumer = 1 )
   { c1: while (TRUE)
          {     await p # c;
            c2: box := Get(box);
            c3: c := c (+) 1
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
      /\ pc' = [pc EXCEPT ![0] = "p3"]
      /\ UNCHANGED << p, c >>

p3 == /\ pc[0] = "p3"
      /\ p' = p (+) 1
      /\ pc' = [pc EXCEPT ![0] = "p1"]
      /\ UNCHANGED << c, box >>

Producer == p1 \/ p2 \/ p3

c1 == /\ pc[1] = "c1"
      /\ p # c
      /\ pc' = [pc EXCEPT ![1] = "c2"]
      /\ UNCHANGED << p, c, box >>

c2 == /\ pc[1] = "c2"
      /\ box' = Get(box)
      /\ pc' = [pc EXCEPT ![1] = "c3"]
      /\ UNCHANGED << p, c >>

c3 == /\ pc[1] = "c3"
      /\ c' = c (+) 1
      /\ pc' = [pc EXCEPT ![1] = "c1"]
      /\ UNCHANGED << p, box >>

Consumer == c1 \/ c2 \/ c3

Next == Producer \/ Consumer

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars((pc[0] \notin {"p1", "p2"}) /\ Producer)
        /\ WF_vars(Consumer)

\* END TRANSLATION
A == INSTANCE Alternation WITH b <- p (+) c, box <- box
vp == IF pc[0] = "p3" THEN p (+) 1 ELSE p
vc == IF pc[1] = "c3" THEN c (+) 1 ELSE c
A2 == INSTANCE Alternation WITH b <- vp (+) vc

=============================================================================
\* Modification History
\* Last modified Fri Jun 06 11:00:58 CST 2014 by yaojingguo
\* Created Thu Jun 05 09:49:40 CST 2014 by yaojingguo
