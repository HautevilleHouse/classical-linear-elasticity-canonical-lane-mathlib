import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure DirichletBoundary (Ω : Type u) where
  u_d : Ω → ℝ³
  prescribedDisplacement : Prop

structure NeumannBoundary (Ω : Type u) (σ : StressTensor Ω) where
  t : Ω → ℝ³
  tractionCondition : ∀ x, σ.σ x • n = t x

structure BoundaryValueProblem (Ω : Type u) (u : DisplacementField Ω) (σ : StressTensor Ω) (f : BodyForce Ω) where
  equilibrium : EquilibriumEquation Ω σ f
  constitutive : HookesLaw Ω (StrainTensor Ω u) σ
  dirichlet : DirichletBoundary Ω
  neumann : NeumannBoundary Ω σ
  wellPosed : Prop
  wellPosedTerm : wellPosed

def BVPConsistencyClosed (Ω : Type u) (u : DisplacementField Ω) (σ : StressTensor Ω) (f : BodyForce Ω)
    (B : BoundaryValueProblem Ω u σ f) : Prop :=
  B.equilibrium.equilibriumClosed ∧ B.constitutive.hookesLawClosed ∧ B.wellPosed

theorem bvp_consistency_closed (Ω : Type u) (u : DisplacementField Ω) (σ : StressTensor Ω) (f : BodyForce Ω)
    (B : BoundaryValueProblem Ω u σ f) : BVPConsistencyClosed Ω u σ f B := by
  exact And.intro B.equilibrium.equilibriumClosedTerm
    (And.intro B.constitutive.hookesLawClosedTerm B.wellPosedTerm)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse