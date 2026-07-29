import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassicalLinearElasticityCanonicalLaneLean.EquilibriumEquation

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure SolutionPackage where
  displacementSolution : Prop
  strainUniqueness : Prop
  stressUniqueness : Prop
  wellPosedness : Prop

structure SolutionEvidence (S : SolutionPackage) where
  displacementSolutionClosed : S.displacementSolution
  strainUniquenessClosed : S.strainUniqueness
  stressUniquenessClosed : S.stressUniqueness
  wellPosednessClosed : S.wellPosedness

def SolutionClosed (S : SolutionPackage) : Prop :=
  S.displacementSolution ∧ S.strainUniqueness ∧
  S.stressUniqueness ∧ S.wellPosedness

theorem solution_closed_from_evidence (S : SolutionPackage)
    (E : SolutionEvidence S) : SolutionClosed S := by
  exact And.intro E.displacementSolutionClosed
    (And.intro E.strainUniquenessClosed
      (And.intro E.stressUniquenessClosed E.wellPosednessClosed))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse