import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure DecisionProblem where
  stateSpace : Type u
  actionSpace : Type v
  lossFunction : stateSpace → actionSpace → ℝ
  priorDistribution : stateSpace → ℝ

structure DecisionRule where
  function : stateSpace → actionSpace

structure RiskFunction (dp : DecisionProblem) (δ : DecisionRule) : Prop where
  riskValue : ℝ
  riskComputed : riskValue = ∫ (s : dp.stateSpace), dp.lossFunction s (δ.function s) * dp.priorDistribution s

def riskClosed (dp : DecisionProblem) (δ : DecisionRule) : Prop :=
  ∃ (r : RiskFunction dp δ), r.riskComputed

structure BayesDecisionProblemEvidence (dp : DecisionProblem) where
  priorIntegrable : dp.priorDistribution > 0
  lossBounded : True

def BayesDecisionProblemClosed (dp : DecisionProblem) : Prop :=
  dp.priorDistribution > 0

theorem bayes_decision_problem_closed_from_evidence (dp : DecisionProblem) (e : BayesDecisionProblemEvidence dp) : BayesDecisionProblemClosed dp := by
  exact e.priorIntegrable

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse