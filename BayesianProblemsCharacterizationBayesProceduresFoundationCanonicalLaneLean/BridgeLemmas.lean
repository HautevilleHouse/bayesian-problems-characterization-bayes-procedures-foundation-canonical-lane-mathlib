import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BayesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.bayesRiskFinite

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse