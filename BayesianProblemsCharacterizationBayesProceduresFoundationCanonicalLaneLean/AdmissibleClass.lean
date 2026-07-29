import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure BayesAdmittedObject where
  priorDistribution : Type u
  likelihoodFunction : Type v
  parameterSpace : Type w
  observationSpace : Type x
  decisionSpace : Type y
  lossFunction : Type z
  posteriorDistribution : Type u_1
  bayesDecisionRule : Type u_2
  bayesRisk : Prop
  bayesRiskFinite : bayesRisk

def BayesWitnessClosed (O : BayesAdmittedObject) : Prop :=
  O.bayesRiskFinite

structure AdmissibleClass where
  object : BayesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BayesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse