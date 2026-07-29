import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.StressConstitutive

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure EquilibriumPackage where
  balanceOfLinearMomentum : Prop
  stressDivergence : Prop
  bodyForceIncluded : Prop
  tractionBoundaryCondition : Prop

structure EquilibriumEvidence (E : EquilibriumPackage) where
  balanceOfLinearMomentumClosed : E.balanceOfLinearMomentum
  stressDivergenceClosed : E.stressDivergence
  bodyForceIncludedClosed : E.bodyForceIncluded
  tractionBoundaryConditionClosed : E.tractionBoundaryCondition

def EquilibriumClosed (E : EquilibriumPackage) : Prop :=
  E.balanceOfLinearMomentum ∧ E.stressDivergence ∧
  E.bodyForceIncluded ∧ E.tractionBoundaryCondition

theorem equilibrium_closed_from_evidence (E : EquilibriumPackage)
    (Ev : EquilibriumEvidence E) : EquilibriumClosed E := by
  exact And.intro Ev.balanceOfLinearMomentumClosed
    (And.intro Ev.stressDivergenceClosed
      (And.intro Ev.bodyForceIncludedClosed Ev.tractionBoundaryConditionClosed))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse