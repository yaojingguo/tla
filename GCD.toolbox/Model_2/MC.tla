---- MODULE MC ----
EXTENDS GCD, TLC

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_140179101677811000 ==
0..100
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_140179101678812000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_140179101679813000 == 
<<GCD1, GCD2, GCD2>>
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_140179101679813000>>)
----

=============================================================================
\* Modification History
\* Created Tue Jun 03 18:23:36 CST 2014 by yaojingguo
