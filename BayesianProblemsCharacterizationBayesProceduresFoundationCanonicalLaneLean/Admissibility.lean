import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : BayesProcedure
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure BayesAdmittedObject where
  procedure : BayesProcedure
  admissible : Prop
  conclusion : admissible

open HautevilleHouse.CanonicalLaneMathlibCore

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BayesProcedureClosed A.object.procedure

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.procedure.bayesRiskMinimized

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse