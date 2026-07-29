import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

def BayesianProblemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bayesian_problems_endgame (A : AdmissibleClass) :
    BayesianProblemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse