import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Bayes Risk Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure BayesRiskPackage (A : AdmittedObject) (Ω : Type w) where
  decisionRule : DecisionRulePackage A Ω
  bayesRiskValue : ℝ
  bayesRiskMinimal : ∀ (d : DecisionRulePackage A Ω), bayesRiskValue ≤ ∫ (θ : A.parameterSpace), d.riskFunction θ * A.priorDistribution θ
  admissibleDecision : ∃ (d : DecisionRulePackage A Ω), bayesRiskValue = ∫ (θ : A.parameterSpace), d.riskFunction θ * A.priorDistribution θ

structure BayesRiskEvidence {A : AdmittedObject} {Ω : Type w}
    (B : BayesRiskPackage A Ω) where
  bayesRiskMinimalClosed : B.bayesRiskMinimal
  admissibleDecisionClosed : B.admissibleDecision

def BayesRiskClosed {A : AdmittedObject} {Ω : Type w}
    (B : BayesRiskPackage A Ω) : Prop :=
  (∀ (d : DecisionRulePackage A Ω), B.bayesRiskValue ≤ ∫ (θ : A.parameterSpace), d.riskFunction θ * A.priorDistribution θ) ∧
  (∃ (d : DecisionRulePackage A Ω), B.bayesRiskValue = ∫ (θ : A.parameterSpace), d.riskFunction θ * A.priorDistribution θ)

theorem bayes_risk_closed_from_evidence
    {A : AdmittedObject} {Ω : Type w} (B : BayesRiskPackage A Ω)
    (E : BayesRiskEvidence B) : BayesRiskClosed B := by
  exact And.intro E.bayesRiskMinimalClosed E.admissibleDecisionClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse
