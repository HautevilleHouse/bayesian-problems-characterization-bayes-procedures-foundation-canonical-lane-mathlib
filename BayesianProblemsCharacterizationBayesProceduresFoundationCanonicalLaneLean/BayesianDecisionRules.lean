import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure DecisionRulePackage where
  sampleSpace : Type u
  actionSpace : Type v
  decisionRule : sampleSpace → actionSpace
  measurability : Prop
  admissibility : Prop
  bayesRule : Prop

structure DecisionRuleEvidence (D : DecisionRulePackage) where
  measurabilityClosed : D.measurability
  admissibilityClosed : D.admissibility
  bayesRuleClosed : D.bayesRule

def DecisionRuleClosed (D : DecisionRulePackage) : Prop :=
  D.measurability ∧ D.admissibility ∧ D.bayesRule

theorem decision_rule_closed_from_evidence (D : DecisionRulePackage)
    (E : DecisionRuleEvidence D) : DecisionRuleClosed D := by
  exact And.intro E.measurabilityClosed
    (And.intro E.admissibilityClosed E.bayesRuleClosed)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse