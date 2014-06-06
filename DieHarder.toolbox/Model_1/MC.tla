---- MODULE MC ----
EXTENDS DieHarder, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_140204496685428000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_140204496686429000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_140204496687430000 == 
(big :> 5) @@ (small :> 3)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_140204496688431000 ==
-100..100
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_140204496689432000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_140204496690433000 ==
\A j \in Jugs: injug[j] # Goal
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_140204496691434000 ==
\A j \in Jugs : Divides(SetGCD({Capacity[k]: k \in Jugs}), injug[j])
----
=============================================================================
\* Modification History
\* Created Fri Jun 06 16:56:06 CST 2014 by yaojingguo
