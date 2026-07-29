import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.StrainTensor

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure StressStrainConstitutivePackage where
  stressTensor : Type u
  elasticityTensor : Type v
  hookesLawLinear : Prop
  isotropyCondition : Prop
  positiveDefiniteElasticity : Prop

structure StressStrainEvidence (C : StressStrainConstitutivePackage) where
  hookesLawLinearClosed : C.hookesLawLinear
  isotropyConditionClosed : C.isotropyCondition
  positiveDefiniteElasticityClosed : C.positiveDefiniteElasticity

def StressStrainClosed (C : StressStrainConstitutivePackage) : Prop :=
  C.hookesLawLinear ∧ C.isotropyCondition ∧ C.positiveDefiniteElasticity

theorem stress_strain_closed_from_evidence (C : StressStrainConstitutivePackage)
    (E : StressStrainEvidence C) : StressStrainClosed C := by
  exact And.intro E.hookesLawLinearClosed
    (And.intro E.isotropyConditionClosed E.positiveDefiniteElasticityClosed)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse