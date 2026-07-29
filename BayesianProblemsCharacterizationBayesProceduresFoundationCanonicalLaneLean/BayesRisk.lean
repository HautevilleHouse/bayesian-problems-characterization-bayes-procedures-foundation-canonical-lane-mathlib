import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.LossFunction

/-!
# Bayes Risk Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure BayesRiskPackage (M : BayesianModelPackage) (D : DecisionRulePackage M)
    (L : LossFunctionPackage M D) where
  riskFunction : M.parameterSpace → ℝ
  bayesRisk : ℝ
  riskComputed : Prop
  riskFinite : Prop
  bayesRiskMinimal : Prop

structure BayesRiskEvidence {M : BayesianModelPackage} {D : DecisionRulePackage M}
    {L : LossFunctionPackage M D} (B : BayesRiskPackage M D L) where
  riskComputedClosed : B.riskComputed
  riskFiniteClosed : B.riskFinite
  bayesRiskMinimalClosed : B.bayesRiskMinimal

def BayesRiskClosed {M : BayesianModelPackage} {D : DecisionRulePackage M}
    {L : LossFunctionPackage M D} (B : BayesRiskPackage M D L) : Prop :=
  B.riskComputed ∧ B.riskFinite ∧ B.bayesRiskMinimal

theorem bayes_risk_closed_from_evidence {M : BayesianModelPackage} {D : DecisionRulePackage M}
    {L : LossFunctionPackage M D} (B : BayesRiskPackage M D L) (E : BayesRiskEvidence B) :
    BayesRiskClosed B := by
  exact And.intro E.riskComputedClosed (And.intro E.riskFiniteClosed E.bayesRiskMinimalClosed)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse