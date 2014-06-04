---- MODULE MC ----
EXTENDS SetEuclid, TLC

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_14018613607506000 ==
-100..100
----
\* Constant expression definition @modelExpressionEval
const_expr_14018613607607000 == 
SetSum({10, 20, 100})
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_14018613607607000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_14018613607708000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_14018613607809000 ==
( pc = "Done" ) => (S = { SetGCD(Input) } )
----
=============================================================================
\* Modification History
\* Created Wed Jun 04 13:56:00 CST 2014 by yaojingguo
