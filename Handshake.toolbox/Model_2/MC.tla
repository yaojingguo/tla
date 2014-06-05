---- MODULE MC ----
EXTENDS Handshake, TLC

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140195484600724000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_140195484601725000 ==
pc[1] = "c1"
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_140195484602726000 ==
A!Spec
----
=============================================================================
\* Modification History
\* Created Thu Jun 05 15:54:06 CST 2014 by yaojingguo
