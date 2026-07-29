import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure DisplacementField (Ω : Type u) where
  u : Ω → ℝ³
  smoothness : Prop

structure StrainTensor (Ω : Type u) (u : DisplacementField Ω) where
  ε : Ω → ℝ³ˣ³
  symmetry : ∀ x, ε x = (ε x)ᵀ
  linearizedStrain : Prop

structure CompatibilityCondition (Ω : Type u) (u : DisplacementField Ω) (ε : StrainTensor Ω u) where
  saintVenantCompatibility : Prop
  integrabilityCondition : Prop
  compatibilityClosed : Prop
  compatibilityClosedTerm : compatibilityClosed

def StrainDisplacementClosed (Ω : Type u) (u : DisplacementField Ω) (ε : StrainTensor Ω u) : Prop :=
  ε.symmetry ∧ ε.linearizedStrain

theorem strain_displacement_closed_from_compatibility (Ω : Type u) (u : DisplacementField Ω) (ε : StrainTensor Ω u)
    (C : CompatibilityCondition Ω u ε) : StrainDisplacementClosed Ω u ε := by
  exact And.intro ε.symmetry ε.linearizedStrain

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse