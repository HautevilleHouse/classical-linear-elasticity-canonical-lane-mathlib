import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure EquilibriumLaminatePackage where
  equilibriumEquations : Type u
  tractionBoundaryConditions : Prop
  displacementBoundaryConditions : Prop
  stressDivergence : Prop
  weakFormulation : Prop

structure EquilibriumLaminateEvidence (E : EquilibriumLaminatePackage) where
  equilibriumEquationsClosed : E.equilibriumEquations
  tractionBoundaryConditionsClosed : E.tractionBoundaryConditions
  displacementBoundaryConditionsClosed : E.displacementBoundaryConditions
  stressDivergenceClosed : E.stressDivergence
  weakFormulationClosed : E.weakFormulation

def EquilibriumLaminateClosed (E : EquilibriumLaminatePackage) : Prop :=
  E.equilibriumEquations ∧ E.tractionBoundaryConditions ∧
  E.displacementBoundaryConditions ∧ E.stressDivergence ∧ E.weakFormulation

theorem equilibrium_laminate_closed_from_evidence (E : EquilibriumLaminatePackage)
    (Ev : EquilibriumLaminateEvidence E) : EquilibriumLaminateClosed E := by
  exact And.intro Ev.equilibriumEquationsClosed
    (And.intro Ev.tractionBoundaryConditionsClosed
      (And.intro Ev.displacementBoundaryConditionsClosed
        (And.intro Ev.stressDivergenceClosed Ev.weakFormulationClosed)))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
