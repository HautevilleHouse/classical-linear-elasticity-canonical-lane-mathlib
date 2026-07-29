import ClassicalLinearElasticityCanonicalLaneLean.ElasticityAdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
