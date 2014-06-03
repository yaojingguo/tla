------------------------------ MODULE PDieHard ------------------------------
EXTENDS Integers
Min(m, n) == IF m < n THEN m ELSE n
(***************************************************************************
--algorithm DieHard {
  variables big = 0, small = 0;
  { while (TRUE)
      { either big := 5    \* fill the big jug
        or     small := 3  \* fill the small jug
        or     big := 0    \* empty the big jug
        or     small := 0  \* empty the small jug
        or     \* pour from small to big
               with (poured = Min (big + small, 5) - big)
                   { big   := big + poured;
                     small := small - poured }
        or     \* pour from big to small
               with (poured = min (big + small, 3) - small)
                   { big   := big - poured;
                     small := small + poured }
       }
}

 ***************************************************************************)
=============================================================================
\* Modification History
\* Last modified Fri May 30 10:20:45 CST 2014 by yaojingguo
\* Created Fri May 30 09:55:01 CST 2014 by yaojingguo
