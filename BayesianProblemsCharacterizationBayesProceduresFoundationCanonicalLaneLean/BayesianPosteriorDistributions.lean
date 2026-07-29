import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure PosteriorDistributionPackage where
  sampleSpace : Type u
  parameterSpace : Type v
  prior : PriorDistributionPackage
  likelihood : sampleSpace → parameterSpace → ℝ
  posteriorMeasure : sampleSpace → Type w
  posteriorDefined : Prop
  updateConsistency : Prop

structure PosteriorDistributionEvidence (P : PosteriorDistributionPackage) where
  posteriorDefinedClosed : P.posteriorDefined
  updateConsistencyClosed : P.updateConsistency

def PosteriorDistributionClosed (P : PosteriorDistributionPackage) : Prop :=
  P.posteriorDefined ∧ P.updateConsistency

theorem posterior_distribution_closed_from_evidence (P : PosteriorDistributionPackage)
    (E : PosteriorDistributionEvidence P) : PosteriorDistributionClosed P := by
  exact And.intro E.posteriorDefinedClosed E.updateConsistencyClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse