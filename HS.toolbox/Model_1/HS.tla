--------------------------------- MODULE HS ---------------------------------
EXTENDS Integers

a (+) b == (a + b) % 2

(***************************************************************************
--algorithm Handshake {

    variables p = 0, c = 0 ;
    process (Producer = 0)
      { pe: while (TRUE)
              {      await p =  c ;
                put: skip ;
                px:  p := p (+) 1   }
      }
      
    process (Consumer = 1)
      { ce: while (TRUE)
              {      await p # c ;
                get: skip ;
                cx:  c := c (+) 1  }
      }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES p, c, pc

vars == << p, c, pc >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ p = 0
        /\ c = 0
        /\ pc = [self \in ProcSet |-> CASE self = 0 -> "pe"
                                        [] self = 1 -> "ce"]

pe == /\ pc[0] = "pe"
      /\ p =  c
      /\ pc' = [pc EXCEPT ![0] = "put"]
      /\ UNCHANGED << p, c >>

put == /\ pc[0] = "put"
       /\ TRUE
       /\ pc' = [pc EXCEPT ![0] = "px"]
       /\ UNCHANGED << p, c >>

px == /\ pc[0] = "px"
      /\ p' = p (+) 1
      /\ pc' = [pc EXCEPT ![0] = "pe"]
      /\ c' = c

Producer == pe \/ put \/ px

ce == /\ pc[1] = "ce"
      /\ p # c
      /\ pc' = [pc EXCEPT ![1] = "get"]
      /\ UNCHANGED << p, c >>

get == /\ pc[1] = "get"
       /\ TRUE
       /\ pc' = [pc EXCEPT ![1] = "cx"]
       /\ UNCHANGED << p, c >>

cx == /\ pc[1] = "cx"
      /\ c' = c (+) 1
      /\ pc' = [pc EXCEPT ![1] = "ce"]
      /\ p' = p

Consumer == ce \/ get \/ cx

Next == Producer \/ Consumer

Spec == Init /\ [][Next]_vars

\* END TRANSLATION
 
Alt == INSTANCE AltSpec WITH b <- p (+) c

=============================================================================
\* Modification History
\* Last modified Fri Jun 06 16:37:04 CST 2014 by yaojingguo
\* Created Fri Jun 06 16:27:49 CST 2014 by yaojingguo
