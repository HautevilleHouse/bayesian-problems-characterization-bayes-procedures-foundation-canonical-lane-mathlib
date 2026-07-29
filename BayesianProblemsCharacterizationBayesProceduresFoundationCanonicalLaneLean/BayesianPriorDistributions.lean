import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure PriorDistributionPackage where
  parameterSpace : Type u
  priorMeasure : Type v
  priorMeasureOverParameterSpace : Prop
  priorRegularity : Prop
  priorSupport : Prop

structure PriorDistributionEvidence (P : PriorDistributionPackage) where
  priorMeasureOverParameterSpaceClosed : P.priorMeasureOverParameterSpace
  priorRegularityClosed : P.priorRegularity
  priorSupportClosed : P.priorSupport

def PriorDistributionClosed (P : PriorDistributionPackage) : Prop :=
  P.priorMeasureOverParameterSpace ∧ P.priorRegularity ∧ P.priorSupport

theorem prior_distribution_closed_from_evidence (P : PriorDistributionPackage)
    (E : PriorDistributionEvidence P) : PriorDistributionClosed P := by
  exact And.intro E.priorMeasureOverParameterSpaceClosed
    (And.intro E.priorRegularityClosed E.priorSupportClosed)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse