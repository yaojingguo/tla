---- MODULE MC ----
EXTENDS GCD, TLC

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_140152230220317000 ==
-1000..1000
----
\* Constant expression definition @modelExpressionEval
const_expr_140152230221318000 == 
GCD(6, 12)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_140152230221318000>>)
----

=============================================================================
\* Modification History
\* Created Sat May 31 15:45:02 CST 2014 by jing
