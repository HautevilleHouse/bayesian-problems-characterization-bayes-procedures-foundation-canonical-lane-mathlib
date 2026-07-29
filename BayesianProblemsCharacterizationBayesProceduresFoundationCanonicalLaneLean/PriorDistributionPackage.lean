import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Prior Distribution Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure PriorDistributionPackage (A : AdmittedObject) where
  distributionFamily : Type u
  hyperparameters : distributionFamily → ℝ
  support : Set (A.parameterSpace)
  properDistribution : ∀ (θ : A.parameterSpace), θ ∈ support → A.priorDistribution θ ≥ 0
  integratesToOne : ∫ θ, A.priorDistribution θ = 1

structure PriorDistributionEvidence {A : AdmittedObject} (P : PriorDistributionPackage A) where
  distributionFamilyClosed : P.distributionFamily = P.distributionFamily
  hyperparametersClosed : P.hyperparameters = P.hyperparameters
  supportClosed : P.support = P.support
  properDistributionClosed : P.properDistribution
  integratesToOneClosed : P.integratesToOne

def PriorDistributionClosed {A : AdmittedObject} (P : PriorDistributionPackage A) : Prop :=
  (∀ (θ : A.parameterSpace), θ ∈ P.support → A.priorDistribution θ ≥ 0) ∧
  (∫ θ, A.priorDistribution θ = 1)

theorem prior_distribution_closed_from_evidence
    {A : AdmittedObject} (P : PriorDistributionPackage A)
    (E : PriorDistributionEvidence P) : PriorDistributionClosed P := by
  exact And.intro E.properDistributionClosed E.integratesToOneClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse
