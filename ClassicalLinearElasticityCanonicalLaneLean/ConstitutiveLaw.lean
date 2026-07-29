import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure ConstitutiveLawPackage where
  hookeTensor : Type u
  stiffnessTetrahedral : Prop
  isotropyReduction : Prop
  positiveDefiniteStiffness : Prop
  cauchyStressFromStrain : Prop

structure ConstitutiveLawEvidence (C : ConstitutiveLawPackage) where
  hookeTensorDefined : C.hookeTensor
  stiffnessTetrahedralClosed : C.stiffnessTetrahedral
  isotropyReductionClosed : C.isotropyReduction
  positiveDefiniteStiffnessClosed : C.positiveDefiniteStiffness
  cauchyStressFromStrainClosed : C.cauchyStressFromStrain

def ConstitutiveLawClosed (C : ConstitutiveLawPackage) : Prop :=
  C.hookeTensor ∧ C.stiffnessTetrahedral ∧ C.isotropyReduction ∧
  C.positiveDefiniteStiffness ∧ C.cauchyStressFromStrain

theorem constitutive_law_closed_from_evidence (C : ConstitutiveLawPackage)
    (E : ConstitutiveLawEvidence C) : ConstitutiveLawClosed C := by
  exact And.intro E.hookeTensorDefined
    (And.intro E.stiffnessTetrahedralClosed
      (And.intro E.isotropyReductionClosed
        (And.intro E.positiveDefiniteStiffnessClosed E.cauchyStressFromStrainClosed)))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
