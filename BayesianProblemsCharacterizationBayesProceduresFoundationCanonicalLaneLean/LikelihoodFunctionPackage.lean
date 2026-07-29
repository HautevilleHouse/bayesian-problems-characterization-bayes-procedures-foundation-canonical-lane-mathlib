import BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Likelihood Function Package
-/

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure LikelihoodFunctionPackage (A : AdmittedObject) (Ω : Type w) where
  dataSpace : Type v
  likelihoodValues : A.parameterSpace → Ω → ℝ
  measurable : ∀ (θ : A.parameterSpace), Measurable (likelihoodValues θ)
  normalized : ∀ (θ : A.parameterSpace), ∫ (x : Ω), likelihoodValues θ x = 1

structure LikelihoodFunctionEvidence {A : AdmittedObject} {Ω : Type w}
    (L : LikelihoodFunctionPackage A Ω) where
  measurableClosed : L.measurable
  normalizedClosed : L.normalized

def LikelihoodFunctionClosed {A : AdmittedObject} {Ω : Type w}
    (L : LikelihoodFunctionPackage A Ω) : Prop :=
  (∀ (θ : A.parameterSpace), Measurable (L.likelihoodValues θ)) ∧
  (∀ (θ : A.parameterSpace), ∫ (x : Ω), L.likelihoodValues θ x = 1)

theorem likelihood_function_closed_from_evidence
    {A : AdmittedObject} {Ω : Type w} (L : LikelihoodFunctionPackage A Ω)
    (E : LikelihoodFunctionEvidence L) : LikelihoodFunctionClosed L := by
  exact And.intro E.measurableClosed E.normalizedClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse
