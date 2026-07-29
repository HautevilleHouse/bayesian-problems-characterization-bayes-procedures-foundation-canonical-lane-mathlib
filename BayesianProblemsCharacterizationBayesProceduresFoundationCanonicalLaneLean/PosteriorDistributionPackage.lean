import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Posterior Distribution Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure PosteriorDistributionPackage (A : AdmittedObject) (Ω : Type w) where
  prior : A.priorDistribution
  likelihood : A.likelihoodFunction
  posteriorValues : A.parameterSpace → Ω → ℝ
  bayesRule : ∀ (θ : A.parameterSpace) (x : Ω), posteriorValues θ x = (likelihood θ x) * (prior θ) / (∫ (t : A.parameterSpace), (likelihood t x) * (prior t))
  integratesToOne : ∀ (x : Ω), ∫ (θ : A.parameterSpace), posteriorValues θ x = 1

structure PosteriorDistributionEvidence {A : AdmittedObject} {Ω : Type w}
    (P : PosteriorDistributionPackage A Ω) where
  bayesRuleClosed : P.bayesRule
  integratesToOneClosed : P.integratesToOne

def PosteriorDistributionClosed {A : AdmittedObject} {Ω : Type w}
    (P : PosteriorDistributionPackage A Ω) : Prop :=
  (∀ (θ : A.parameterSpace) (x : Ω), P.posteriorValues θ x = (P.likelihood θ x) * (P.prior θ) / (∫ (t : A.parameterSpace), (P.likelihood t x) * (P.prior t))) ∧
  (∀ (x : Ω), ∫ (θ : A.parameterSpace), P.posteriorValues θ x = 1)

theorem posterior_distribution_closed_from_evidence
    {A : AdmittedObject} {Ω : Type w} (P : PosteriorDistributionPackage A Ω)
    (E : PosteriorDistributionEvidence P) : PosteriorDistributionClosed P := by
  exact And.intro E.bayesRuleClosed E.integratesToOneClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse
