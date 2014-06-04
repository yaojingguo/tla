---- MODULE MC ----
EXTENDS DieHarder, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_1401871287883226000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_1401871287893227000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_1401871287903228000 == 
(big :> 6) @@ (small :> 3)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_1401871287913229000 ==
-100..100
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1401871287923230000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1401871287933231000 ==
\A j \in Jugs : Divides(SetGCD({Capacity[k]: k \in Jugs}), injug[j])
----
=============================================================================
\* Modification History
\* Created Wed Jun 04 16:41:27 CST 2014 by yaojingguo
