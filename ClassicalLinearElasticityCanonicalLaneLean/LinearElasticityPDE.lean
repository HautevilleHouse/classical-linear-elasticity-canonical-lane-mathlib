import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure LinearElasticityPDEPackage where
  displacementField : Type u
  strainTensor : Type v
  stressTensor : Type w
  equilibriumEquation : Prop
  constitutiveLaw : Prop
  compatibilityCondition : Prop
  boundaryConditions : Prop

structure LinearElasticityPDEEvidence (E : LinearElasticityPDEPackage) where
  equilibriumEquationClosed : E.equilibriumEquation
  constitutiveLawClosed : E.constitutiveLaw
  compatibilityConditionClosed : E.compatibilityCondition
  boundaryConditionsClosed : E.boundaryConditions

def LinearElasticityPDEClosed (E : LinearElasticityPDEPackage) : Prop :=
  E.equilibriumEquation ∧ E.constitutiveLaw ∧ E.compatibilityCondition ∧ E.boundaryConditions

theorem linear_elasticity_pde_closed_from_evidence (E : LinearElasticityPDEPackage)
    (Ev : LinearElasticityPDEEvidence E) : LinearElasticityPDEClosed E := by
  exact And.intro Ev.equilibriumEquationClosed
    (And.intro Ev.constitutiveLawClosed
      (And.intro Ev.compatibilityConditionClosed Ev.boundaryConditionsClosed))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
