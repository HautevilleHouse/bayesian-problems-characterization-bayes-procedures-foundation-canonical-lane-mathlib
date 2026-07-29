import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Admissible Decision Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure AdmissibleDecisionPackage (A : AdmittedObject) (Ω : Type w) where
  decisionRule : DecisionRulePackage A Ω
  bayesRisk : BayesRiskPackage A Ω
  admissibilityCondition : ∀ (d' : DecisionRulePackage A Ω),
    (∀ (θ : A.parameterSpace), d'.riskFunction θ ≤ decisionRule.riskFunction θ) →
    (∀ (θ : A.parameterSpace), d'.riskFunction θ = decisionRule.riskFunction θ)

structure AdmissibleDecisionEvidence {A : AdmittedObject} {Ω : Type w}
    (AD : AdmissibleDecisionPackage A Ω) where
  admissibilityConditionClosed : AD.admissibilityCondition

def AdmissibleDecisionClosed {A : AdmittedObject} {Ω : Type w}
    (AD : AdmissibleDecisionPackage A Ω) : Prop :=
  ∀ (d' : DecisionRulePackage A Ω),
    (∀ (θ : A.parameterSpace), d'.riskFunction θ ≤ AD.decisionRule.riskFunction θ) →
    (∀ (θ : A.parameterSpace), d'.riskFunction θ = AD.decisionRule.riskFunction θ)

theorem admissible_decision_closed_from_evidence
    {A : AdmittedObject} {Ω : Type w} (AD : AdmissibleDecisionPackage A Ω)
    (E : AdmissibleDecisionEvidence AD) : AdmissibleDecisionClosed AD := by
  exact E.admissibilityConditionClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse
