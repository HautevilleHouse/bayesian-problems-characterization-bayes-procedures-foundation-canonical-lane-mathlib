import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.BayesianModel

/-!
# Decision Rule Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure DecisionRulePackage (M : BayesianModelPackage) where
  actionSpace : Type w
  decisionFunction : M.sampleSpace → actionSpace
  ruleMeasurable : Prop
  ruleAdmissible : Prop

structure DecisionRuleEvidence {M : BayesianModelPackage} (D : DecisionRulePackage M) where
  ruleMeasurableClosed : D.ruleMeasurable
  ruleAdmissibleClosed : D.ruleAdmissible

def DecisionRuleClosed {M : BayesianModelPackage} (D : DecisionRulePackage M) : Prop :=
  D.ruleMeasurable ∧ D.ruleAdmissible

theorem decision_rule_closed_from_evidence {M : BayesianModelPackage} (D : DecisionRulePackage M)
    (E : DecisionRuleEvidence D) : DecisionRuleClosed D := by
  exact And.intro E.ruleMeasurableClosed E.ruleAdmissibleClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse