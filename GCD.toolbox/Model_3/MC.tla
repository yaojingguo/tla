---- MODULE MC ----
EXTENDS GCD, TLC

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_140185136790523000 ==
-30..30
----
\* Constant expression definition @modelExpressionEval
const_expr_140185136791524000 == 
SetGCD({14, 28})
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_140185136791524000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jun 04 11:09:27 CST 2014 by yaojingguo
