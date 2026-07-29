import canonicalLaneMathlib.AdmissibleClass
import ClassicalLinearElasticityCanonicalLaneLean.ConstitutiveLaw
import ClassicalLinearElasticityCanonicalLaneLean.EquilibriumLaminate
import ClassicalLinearElasticityCanonicalLaneLean.KornInequalityBridge

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

def ConstrainedElasticityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_elasticity_endgame (A : AdmissibleClass) :
    ConstrainedElasticityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
