---------------------------- MODULE OneBitClock ----------------------------
EXTENDS Integers
VARIABLE b
TypeOK == b \in {0, 1}
Init1 == (b=0) \/ (b=1)
Next1 == \/ /\ b = 0
            /\ b' = 1
         \/ /\ b = 1
            /\ b' = 0
Next2 == b' = IF b = 0 THEN 1 ELSE 0

Next3 == b' = (b + 1) % 2


=============================================================================
\* Modification History
\* Last modified Thu May 29 14:57:31 CST 2014 by yaojingguo
\* Created Mon May 26 21:18:44 CST 2014 by yaojingguo
