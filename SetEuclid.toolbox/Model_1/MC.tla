---- MODULE MC ----
EXTENDS SetEuclid, TLC

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_14018510023335000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_14018510023436000 ==
ParitialCorrectness == ( pc = "Done") => (S = {SetGCD(Input)})
----
=============================================================================
\* Modification History
\* Created Wed Jun 04 11:03:22 CST 2014 by yaojingguo
