import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure RiskComparison (dp : DecisionProblem) (δ1 δ2 : DecisionRule) where
  betterThan : Prop
  strictlyBetterThan : Prop
  proofBetter : betterThan → (RiskFunction dp δ1).riskValue ≤ (RiskFunction dp δ2).riskValue

structure RiskComparisonEvidence (dp : DecisionProblem) (δ1 δ2 : DecisionRule) (rc : RiskComparison dp δ1 δ2) where
  betterClosed : rc.betterThan
  strictlyBetterClosed : rc.strictlyBetterThan

def RiskComparisonClosed (dp : DecisionProblem) (δ1 δ2 : DecisionRule) (rc : RiskComparison dp δ1 δ2) : Prop :=
  rc.betterThan ∧ rc.strictlyBetterThan

theorem risk_comparison_closed_from_evidence (dp : DecisionProblem) (δ1 δ2 : DecisionRule) (rc : RiskComparison dp δ1 δ2) (e : RiskComparisonEvidence dp δ1 δ2 rc) : RiskComparisonClosed dp δ1 δ2 rc := by
  exact And.intro e.betterClosed e.strictlyBetterClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse