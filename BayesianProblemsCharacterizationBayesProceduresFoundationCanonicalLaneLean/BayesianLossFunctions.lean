import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure LossFunctionPackage where
  actionSpace : Type u
  parameterSpace : Type v
  lossFunction : actionSpace → parameterSpace → ℝ
  lossLowerBounded : Prop
  lossContinuous : Prop
  lossNonnegative : Prop

structure LossFunctionEvidence (L : LossFunctionPackage) where
  lossLowerBoundedClosed : L.lossLowerBounded
  lossContinuousClosed : L.lossContinuous
  lossNonnegativeClosed : L.lossNonnegative

def LossFunctionClosed (L : LossFunctionPackage) : Prop :=
  L.lossLowerBounded ∧ L.lossContinuous ∧ L.lossNonnegative

theorem loss_function_closed_from_evidence (L : LossFunctionPackage)
    (E : LossFunctionEvidence L) : LossFunctionClosed L := by
  exact And.intro E.lossLowerBoundedClosed
    (And.intro E.lossContinuousClosed E.lossNonnegativeClosed)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse