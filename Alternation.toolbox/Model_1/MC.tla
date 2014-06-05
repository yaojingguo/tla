---- MODULE MC ----
EXTENDS Alternation, TLC

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140193083885220000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_140193083886221000 ==
Len(box) = 1 \/ Len(box) = 0
----
=============================================================================
\* Modification History
\* Created Thu Jun 05 09:13:58 CST 2014 by yaojingguo
