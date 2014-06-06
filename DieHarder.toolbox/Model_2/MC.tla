---- MODULE MC ----
EXTENDS DieHarder, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_140204496346724000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_140204496347725000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_140204496348726000 == 
(big :> 5) @@ (small :> 3)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140204496349727000 ==
Spec
----
=============================================================================
\* Modification History
\* Created Fri Jun 06 16:56:03 CST 2014 by yaojingguo
