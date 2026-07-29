import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure ElasticBody where
  materialDomain : Type u
  topology : TopologicalSpace materialDomain
  elasticProperties : Prop
  infinitesimalStrainDefined : Prop
  stressStrainLawAdmitted : Prop
  equilibriumCondition : Prop

structure ElasticAdmittedObject where
  body : ElasticBody
  linearElasticityEquations : Prop
  boundaryConditionsAdmitted : Prop
  solutionExistenceGuaranteed : Prop
  conclusion : solutionExistenceGuaranteed

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse