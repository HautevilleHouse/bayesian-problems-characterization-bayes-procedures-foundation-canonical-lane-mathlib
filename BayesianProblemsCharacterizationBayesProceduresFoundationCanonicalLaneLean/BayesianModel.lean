import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Bayesian Model Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure BayesianModelPackage where
  parameterSpace : Type u
  sampleSpace : Type v
  priorDistribution : parameterSpace → ℝ
  likelihood : parameterSpace → sampleSpace → ℝ
  modelWellDefined : Prop
  priorIntegratesToOne : Prop
  likelihoodNonnegative : Prop

structure BayesianModelEvidence (M : BayesianModelPackage) where
  modelWellDefinedClosed : M.modelWellDefined
  priorIntegratesToOneClosed : M.priorIntegratesToOne
  likelihoodNonnegativeClosed : M.likelihoodNonnegative

def BayesianModelClosed (M : BayesianModelPackage) : Prop :=
  M.modelWellDefined ∧ M.priorIntegratesToOne ∧ M.likelihoodNonnegative

theorem bayesian_model_closed_from_evidence (M : BayesianModelPackage) (E : BayesianModelEvidence M) :
    BayesianModelClosed M := by
  exact And.intro E.modelWellDefinedClosed
    (And.intro E.priorIntegratesToOneClosed E.likelihoodNonnegativeClosed)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse