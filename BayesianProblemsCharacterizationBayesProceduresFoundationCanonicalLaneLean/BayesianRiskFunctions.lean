import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure RiskFunctionPackage where
  parameterSpace : Type u
  actionSpace : Type v
  lossFunction : LossFunctionPackage
  decisionRule : DecisionRulePackage
  riskFunction : parameterSpace → ℝ
  riskIntegrable : Prop
  riskUniformlyBounded : Prop

structure RiskFunctionEvidence (R : RiskFunctionPackage) where
  riskIntegrableClosed : R.riskIntegrable
  riskUniformlyBoundedClosed : R.riskUniformlyBounded

def RiskFunctionClosed (R : RiskFunctionPackage) : Prop :=
  R.riskIntegrable ∧ R.riskUniformlyBounded

theorem risk_function_closed_from_evidence (R : RiskFunctionPackage)
    (E : RiskFunctionEvidence R) : RiskFunctionClosed R := by
  exact And.intro E.riskIntegrableClosed E.riskUniformlyBoundedClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse