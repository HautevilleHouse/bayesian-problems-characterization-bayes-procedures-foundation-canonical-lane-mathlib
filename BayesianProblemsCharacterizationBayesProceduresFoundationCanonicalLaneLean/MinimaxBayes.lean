import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean

structure MinimaxProcedure (dp : DecisionProblem) where
  decisionRule : DecisionRule
  minimaxRisk : ℝ
  minimaxRiskMinimized : minimaxRisk = inf (λ (δ : DecisionRule) => max (λ (s : dp.stateSpace) => dp.lossFunction s (δ.function s)))

structure MinimaxEvidence (dp : DecisionProblem) (m : MinimaxProcedure dp) where
  minimaxRiskComputed : m.minimaxRiskMinimized

def MinimaxClosed (dp : DecisionProblem) (m : MinimaxProcedure dp) : Prop :=
  m.minimaxRiskMinimized

theorem minimax_closed_from_evidence (dp : DecisionProblem) (m : MinimaxProcedure dp) (e : MinimaxEvidence dp m) : MinimaxClosed dp m := by
  exact e.minimaxRiskComputed

structure MinimaxBayesEquality (dp : DecisionProblem) where
  bayesProcedure : BayesProcedure dp
  minimaxProcedure : MinimaxProcedure dp
  equality : bayesProcedure.bayesRisk = minimaxProcedure.minimaxRisk

structure MinimaxBayesEqualityEvidence (dp : DecisionProblem) (mbe : MinimaxBayesEquality dp) where
  equalityClosed : mbe.equality

def MinimaxBayesEqualityClosed (dp : DecisionProblem) (mbe : MinimaxBayesEquality dp) : Prop :=
  mbe.equality

theorem minimax_bayes_equality_closed_from_evidence (dp : DecisionProblem) (mbe : MinimaxBayesEquality dp) (e : MinimaxBayesEqualityEvidence dp mbe) : MinimaxBayesEqualityClosed dp mbe := by
  exact e.equalityClosed

end BayesianProblemsCharacterizationBayesProceduresFoundationCanonicalLaneLean
end HautevilleHouse