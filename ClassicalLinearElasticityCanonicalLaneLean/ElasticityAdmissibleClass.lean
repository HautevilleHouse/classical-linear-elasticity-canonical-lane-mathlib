import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure ElasticityAdmittedObject where
  bodyForce : Prop
  tractionBoundary : Prop
  displacementBoundary : Prop
  materialSymmetry : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : ElasticityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
