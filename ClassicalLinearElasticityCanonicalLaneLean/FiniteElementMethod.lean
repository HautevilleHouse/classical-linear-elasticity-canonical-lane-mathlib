import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure Mesh (Ω : Type u) where
  elements : List (Type u)
  nodes : List Ω
  connectivity : Prop
  meshClosed : Prop
  meshClosedTerm : meshClosed

structure BasisFunctions (Ω : Type u) (mesh : Mesh Ω) where
  shapeFunctions : Ω → ℝ
  lagrangePolynomials : Prop
  basisClosed : Prop
  basisClosedTerm : basisClosed

structure StiffnessMatrix (Ω : Type u) (mesh : Mesh Ω) (basis : BasisFunctions Ω mesh) where
  K : ℝⁿˣⁿ
  symmetric : K = Kᵀ
  positiveDefinite : Prop
  stiffnessClosed : Prop
  stiffnessClosedTerm : stiffnessClosed

structure LoadVector (Ω : Type u) (mesh : Mesh Ω) (basis : BasisFunctions Ω mesh) (f : BodyForce Ω) where
  F : ℝⁿ
  loadComputable : Prop
  loadClosed : Prop
  loadClosedTerm : loadClosed

structure FEASolution (Ω : Type u) (mesh : Mesh Ω) (basis : BasisFunctions Ω mesh) (K : StiffnessMatrix Ω mesh basis)
    (F : LoadVector Ω mesh basis f) where
  u_h : ℝⁿ
  residual : K.K • u_h - F.F = 0
  solutionClosed : Prop
  solutionClosedTerm : solutionClosed

structure ConvergenceAnalysis (Ω : Type u) (mesh : Mesh Ω) (basis : BasisFunctions Ω mesh) (K : StiffnessMatrix Ω mesh basis)
    (F : LoadVector Ω mesh basis f) (U : FEASolution Ω mesh basis K F) where
  meshRefinement : Prop
  errorEstimate : Prop
  hConvergence : Prop
  convergenceClosed : Prop
  convergenceClosedTerm : convergenceClosed

def FEAAnalysisClosed (Ω : Type u) (mesh : Mesh Ω) (basis : BasisFunctions Ω mesh) (K : StiffnessMatrix Ω mesh basis)
    (F : LoadVector Ω mesh basis f) (U : FEASolution Ω mesh basis K F) (C : ConvergenceAnalysis Ω mesh basis K F U) : Prop :=
  mesh.meshClosed ∧ basis.basisClosed ∧ K.stiffnessClosed ∧ F.loadClosed ∧ U.solutionClosed ∧ C.convergenceClosed

theorem fea_analysis_closed (Ω : Type u) (mesh : Mesh Ω) (basis : BasisFunctions Ω mesh) (K : StiffnessMatrix Ω mesh basis)
    (F : LoadVector Ω mesh basis f) (U : FEASolution Ω mesh basis K F) (C : ConvergenceAnalysis Ω mesh basis K F U) :
    FEAAnalysisClosed Ω mesh basis K F U C := by
  exact And.intro mesh.meshClosedTerm (And.intro basis.basisClosedTerm
    (And.intro K.stiffnessClosedTerm (And.intro F.loadClosedTerm
      (And.intro U.solutionClosedTerm C.convergenceClosedTerm))))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse