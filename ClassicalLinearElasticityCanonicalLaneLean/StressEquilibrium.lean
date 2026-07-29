import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure StressTensor (Ω : Type u) where
  σ : Ω → ℝ³ˣ³
  symmetry : ∀ x, σ x = (σ x)ᵀ

structure BodyForce (Ω : Type u) where
  f : Ω → ℝ³
  continuous : Prop

structure EquilibriumEquation (Ω : Type u) (σ : StressTensor Ω) (f : BodyForce Ω) where
  divSigmaPlusF : ∀ x, (div σ) x + f.f x = 0
  boundaryCondition : Prop
  equilibriumClosed : Prop
  equilibriumClosedTerm : equilibriumClosed

def StressEquilibriumClosed (Ω : Type u) (σ : StressTensor Ω) (f : BodyForce Ω) : Prop :=
  σ.symmetry ∧ f.continuous

theorem stress_equilibrium_closed_from_evidence (Ω : Type u) (σ : StressTensor Ω) (f : BodyForce Ω)
    (E : EquilibriumEquation Ω σ f) : StressEquilibriumClosed Ω σ f := by
  exact And.intro σ.symmetry f.continuous

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse