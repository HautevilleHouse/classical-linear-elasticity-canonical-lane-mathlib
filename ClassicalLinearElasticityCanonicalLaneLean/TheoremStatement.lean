import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "classical-linear-elasticity-canonical-lane",
  theoremName := "classical-linear-elasticity-canonical-lane",
  theoremObject := "three-dimensional linear elasticity system",
  classicalBoundary := "full Navier-Lamé equations with natural boundary conditions",
  constrainedStatement := "constraint-satisfying displacement-stress pair with constitutive and equilibrium closure",
  certificateLane := "manifold_constrained",
  carriedRemainder := "classical source boundary carried by theoremBoundaryOpen"
}

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse