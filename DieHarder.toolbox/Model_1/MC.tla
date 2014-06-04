---- MODULE MC ----
EXTENDS DieHarder, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_1401872150048306000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_1401872150058307000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_1401872150068308000 == 
(big :> 5) @@ (small :> 3)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_1401872150078309000 ==
-100..100
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1401872150088310000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1401872150098311000 ==
\A j \in Jugs: injug[j] # Goal
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1401872150108312000 ==
\A j \in Jugs : Divides(SetGCD({Capacity[k]: k \in Jugs}), injug[j])
----
=============================================================================
\* Modification History
\* Created Wed Jun 04 16:55:50 CST 2014 by yaojingguo
