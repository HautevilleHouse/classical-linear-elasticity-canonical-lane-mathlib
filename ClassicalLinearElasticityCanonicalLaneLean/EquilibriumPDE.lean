import ClassicalLinearElasticityCanonicalLaneLean.ElasticityAdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure EquilibriumPDEPackage where
  bodyForce : ℝ^3
  boundaryTraction : ℝ^3
  equilibriumEquation : Prop
  weakFormulation : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop

structure EquilibriumPDEEvidence (E : EquilibriumPDEPackage) where
  equilibriumEquationClosed : E.equilibriumEquation
  weakFormulationClosed : E.weakFormulation
  existenceSolutionClosed : E.existenceSolution
  uniquenessSolutionClosed : E.uniquenessSolution

def EquilibriumPDEClosed (E : EquilibriumPDEPackage) : Prop :=
  E.equilibriumEquation ∧ E.weakFormulation ∧ E.existenceSolution ∧ E.uniquenessSolution

theorem equilibrium_pde_closed_from_evidence (E : EquilibriumPDEPackage) (ev : EquilibriumPDEEvidence E) :
    EquilibriumPDEClosed E := by
  exact And.intro ev.equilibriumEquationClosed (And.intro ev.weakFormulationClosed (And.intro ev.existenceSolutionClosed ev.uniquenessSolutionClosed))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse