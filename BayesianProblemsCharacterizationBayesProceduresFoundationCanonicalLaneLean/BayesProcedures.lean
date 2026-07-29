import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure BayesProcedure (dp : DecisionProblem) where
  decisionRule : DecisionRule
  bayesRisk : ℝ
  bayesRiskMinimized : bayesRisk = inf (λ (δ : DecisionRule) => ∫ s, dp.lossFunction s (δ.function s) * dp.priorDistribution s)

structure BayesProcedureEvidence (dp : DecisionProblem) (b : BayesProcedure dp) where
  bayesRiskComputed : b.bayesRiskMinimized

def BayesProcedureClosed (dp : DecisionProblem) (b : BayesProcedure dp) : Prop :=
  b.bayesRiskMinimized

theorem bayes_procedure_closed_from_evidence (dp : DecisionProblem) (b : BayesProcedure dp) (e : BayesProcedureEvidence dp b) : BayesProcedureClosed dp b := by
  exact e.bayesRiskComputed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse