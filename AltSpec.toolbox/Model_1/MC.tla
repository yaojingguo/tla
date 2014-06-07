---- MODULE MC ----
EXTENDS AltSpec, TLC

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140210704795633000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_140210704796634000 ==
~((pc[0] = "put")/\(pc[1] = "get"))
----
=============================================================================
\* Modification History
\* Created Sat Jun 07 10:10:47 CST 2014 by yaojingguo
