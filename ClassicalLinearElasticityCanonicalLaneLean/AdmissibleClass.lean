import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure ElasticityAdmittedObject where
  body : AdmittedObject
  materialLaw : Prop
  deformationGradient : Prop
  conclusion : materialLaw ∧ deformationGradient

structure ElasticityAdmissibleClass where
  object : ElasticityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : ElasticityAdmissibleClass) : Prop :=
  (A.object.materialLaw ∧ A.object.deformationGradient) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse