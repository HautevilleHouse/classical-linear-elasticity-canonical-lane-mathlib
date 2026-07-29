import ClassicalLinearElasticityCanonicalLaneLean.LinearElasticityPDE

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure SaintVenantCompatibilityPackage (E : LinearElasticityPDEPackage) where
  strainCompatibilityEquations : Prop
  deRhamCohomologyVanishes : Prop
  simplyConnectedDomain : Prop
  uniqueDisplacementRecovery : Prop

structure SaintVenantCompatibilityEvidence {E : LinearElasticityPDEPackage}
    (S : SaintVenantCompatibilityPackage E) where
  strainCompatibilityEquationsClosed : S.strainCompatibilityEquations
  deRhamCohomologyVanishesClosed : S.deRhamCohomologyVanishes
  simplyConnectedDomainClosed : S.simplyConnectedDomain
  uniqueDisplacementRecoveryClosed : S.uniqueDisplacementRecovery

def SaintVenantCompatibilityClosed {E : LinearElasticityPDEPackage}
    (S : SaintVenantCompatibilityPackage E) : Prop :=
  S.strainCompatibilityEquations ∧ S.deRhamCohomologyVanishes ∧
  S.simplyConnectedDomain ∧ S.uniqueDisplacementRecovery

theorem saint_venant_compatibility_closed_from_evidence
    {E : LinearElasticityPDEPackage} (S : SaintVenantCompatibilityPackage E)
    (Ev : SaintVenantCompatibilityEvidence S) : SaintVenantCompatibilityClosed S := by
  exact And.intro Ev.strainCompatibilityEquationsClosed
    (And.intro Ev.deRhamCohomologyVanishesClosed
      (And.intro Ev.simplyConnectedDomainClosed Ev.uniqueDisplacementRecoveryClosed))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
