import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure PriorPosteriorPackage where
  priorDistribution : Prop
  likelihoodFunction : Prop
  posteriorClosedForm : Prop
  posteriorProper : Prop

structure PriorPosteriorEvidence (P : PriorPosteriorPackage) where
  priorDistributionClosed : P.priorDistribution
  likelihoodFunctionClosed : P.likelihoodFunction
  posteriorClosedFormClosed : P.posteriorClosedForm
  posteriorProperClosed : P.posteriorProper

def PriorPosteriorClosed (P : PriorPosteriorPackage) : Prop :=
  P.priorDistribution ∧ P.likelihoodFunction ∧ P.posteriorClosedForm ∧ P.posteriorProper

theorem prior_posterior_closed_from_evidence (P : PriorPosteriorPackage) (E : PriorPosteriorEvidence P) :
    PriorPosteriorClosed P := by
  exact And.intro E.priorDistributionClosed
    (And.intro E.likelihoodFunctionClosed
      (And.intro E.posteriorClosedFormClosed E.posteriorProperClosed))

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse