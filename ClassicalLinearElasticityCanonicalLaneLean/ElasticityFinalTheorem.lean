import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.LinearElasticityState
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.StrainTensor
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.StressConstitutive
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.EquilibriumEquation
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.ElasticitySolution

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

def bridgeClosed (A : ElasticAdmittedObject) : Prop :=
  A.body.elasticProperties ∧ A.body.infinitesimalStrainDefined ∧ A.body.stressStrainLawAdmitted

def gateClosed (A : ElasticAdmittedObject) : Prop :=
  A.boundaryConditionsAdmitted ∨ A.solutionExistenceGuaranteed

theorem bridge_from_admissible_object (A : ElasticAdmittedObject) : bridgeClosed A :=
  And.intro A.body.elasticProperties (And.intro A.body.infinitesimalStrainDefined A.body.stressStrainLawAdmitted)

theorem gate_from_admissible_object (A : ElasticAdmittedObject) : gateClosed A := by
  -- Using the conclusion to provide the right disjunct
  exact Or.inr A.conclusion

def ConstrainedElasticityClosure (A : ElasticAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_elasticity_endgame (A : ElasticAdmittedObject) :
    ConstrainedElasticityClosure A := by
  exact And.intro (bridge_from_admissible_object A) (gate_from_admissible_object A)

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse