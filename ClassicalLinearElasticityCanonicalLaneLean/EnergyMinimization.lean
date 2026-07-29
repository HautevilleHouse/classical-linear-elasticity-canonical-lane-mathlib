import ClassicalLinearElasticityCanonicalLaneLean.LinearElasticityPDE

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure EnergyMinimizationPackage (E : LinearElasticityPDEPackage) where
  strainEnergyDensity : Prop
  totalPotentialEnergy : Prop
  firstVariationVanishes : Prop
  secondVariationPositive : Prop
  existenceOfMinimizer : Prop
  uniquenessOfMinimizer : Prop

structure EnergyMinimizationEvidence {E : LinearElasticityPDEPackage}
    (M : EnergyMinimizationPackage E) where
  strainEnergyDensityClosed : M.strainEnergyDensity
  totalPotentialEnergyClosed : M.totalPotentialEnergy
  firstVariationVanishesClosed : M.firstVariationVanishes
  secondVariationPositiveClosed : M.secondVariationPositive
  existenceOfMinimizerClosed : M.existenceOfMinimizer
  uniquenessOfMinimizerClosed : M.uniquenessOfMinimizer

def EnergyMinimizationClosed {E : LinearElasticityPDEPackage}
    (M : EnergyMinimizationPackage E) : Prop :=
  M.strainEnergyDensity ∧ M.totalPotentialEnergy ∧ M.firstVariationVanishes ∧
  M.secondVariationPositive ∧ M.existenceOfMinimizer ∧ M.uniquenessOfMinimizer

theorem energy_minimization_closed_from_evidence
    {E : LinearElasticityPDEPackage} (M : EnergyMinimizationPackage E)
    (Ev : EnergyMinimizationEvidence M) : EnergyMinimizationClosed M := by
  exact And.intro Ev.strainEnergyDensityClosed
    (And.intro Ev.totalPotentialEnergyClosed
      (And.intro Ev.firstVariationVanishesClosed
        (And.intro Ev.secondVariationPositiveClosed
          (And.intro Ev.existenceOfMinimizerClosed Ev.uniquenessOfMinimizerClosed))))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
