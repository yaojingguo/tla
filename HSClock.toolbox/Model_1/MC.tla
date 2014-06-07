---- MODULE MC ----
EXTENDS HSClock, TLC

\* CONSTANT definitions @modelParameterConstants:0N
const_140210424888222000 == 
4
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140210424889223000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_140210424890224000 ==
ca \in [0..(N-1) -> {0, 1}]
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_140210424891225000 ==
CS!Spec
----
=============================================================================
\* Modification History
\* Created Sat Jun 07 09:24:08 CST 2014 by yaojingguo
