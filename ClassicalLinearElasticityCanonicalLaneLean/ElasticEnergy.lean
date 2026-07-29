import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure ElasticEnergyFunctional (Ω : Type) [TopologicalSpace Ω] where
  strainEnergyDensity : Ω → ℝ
  totalEnergy : ℝ
  energyMinimizer : Ω → ℝ³
  positivity : ∀ x : Ω, strainEnergyDensity x ≥ 0

def EnergyClosed (E : ElasticEnergyFunctional Ω) : Prop :=
  E.positivity

theorem energy_closed (E : ElasticEnergyFunctional Ω) : EnergyClosed E :=
  E.positivity

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse