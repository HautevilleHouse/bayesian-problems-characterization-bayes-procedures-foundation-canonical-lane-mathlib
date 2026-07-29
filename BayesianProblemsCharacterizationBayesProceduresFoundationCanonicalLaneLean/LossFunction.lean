import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.DecisionRule

/-!
# Loss Function Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure LossFunctionPackage (M : BayesianModelPackage) (D : DecisionRulePackage M) where
  loss : M.parameterSpace → D.actionSpace → ℝ
  lossNonnegative : Prop
  lossBounded : Prop

structure LossFunctionEvidence {M : BayesianModelPackage} {D : DecisionRulePackage M}
    (L : LossFunctionPackage M D) where
  lossNonnegativeClosed : L.lossNonnegative
  lossBoundedClosed : L.lossBounded

def LossFunctionClosed {M : BayesianModelPackage} {D : DecisionRulePackage M}
    (L : LossFunctionPackage M D) : Prop :=
  L.lossNonnegative ∧ L.lossBounded

theorem loss_function_closed_from_evidence {M : BayesianModelPackage} {D : DecisionRulePackage M}
    (L : LossFunctionPackage M D) (E : LossFunctionEvidence L) : LossFunctionClosed L := by
  exact And.intro E.lossNonnegativeClosed E.lossBoundedClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse