import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.LinearElasticityState

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure InfinitesimalStrainPackage where
  displacementField : Type u
  strainOperator : displacementField -> Prop
  symmetricStrainTensor : Prop
  kinematicCompatibility : Prop
  traceRelation : Prop

structure StrainTensorEvidence (S : InfinitesimalStrainPackage) where
  symmetricStrainTensorClosed : S.symmetricStrainTensor
  kinematicCompatibilityClosed : S.kinematicCompatibility
  traceRelationClosed : S.traceRelation

def StrainTensorClosed (S : InfinitesimalStrainPackage) : Prop :=
  S.symmetricStrainTensor ∧ S.kinematicCompatibility ∧ S.traceRelation

theorem strain_tensor_closed_from_evidence (S : InfinitesimalStrainPackage)
    (E : StrainTensorEvidence S) : StrainTensorClosed S := by
  exact And.intro E.symmetricStrainTensorClosed
    (And.intro E.kinematicCompatibilityClosed E.traceRelationClosed)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse