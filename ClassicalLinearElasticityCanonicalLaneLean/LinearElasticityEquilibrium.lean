import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure ElasticityEquilibriumState (Ω : Type) [TopologicalSpace Ω] where
  displacementField : Ω → ℝ³
  strainTensor : Ω → ℝ³ˣ³
  stressTensor : Ω → ℝ³ˣ³
  equilibriumEquation : ∀ x : Ω, div (stressTensor x) = 0
  boundaryCondition : Prop

def EquilibriumClosed (E : ElasticityEquilibriumState Ω) : Prop :=
  E.equilibriumEquation

theorem equilibrium_closed (E : ElasticityEquilibriumState Ω) : EquilibriumClosed E :=
  E.equilibriumEquation

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse