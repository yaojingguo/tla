---- MODULE MC ----
EXTENDS Alternation, TLC

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140210696016529000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_140210696017530000 ==
Len(box) = 1 \/ Len(box) = 0
----
=============================================================================
\* Modification History
\* Created Sat Jun 07 10:09:20 CST 2014 by yaojingguo
