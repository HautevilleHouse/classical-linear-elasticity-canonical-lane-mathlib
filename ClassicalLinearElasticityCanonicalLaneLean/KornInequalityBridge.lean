import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalLinearElasticityCanonicalLaneLean

structure KornInequalityPackage where
  strainDisplacementRelation : Type u
  rigidMotionsKernel : Prop
  poincareInequality : Prop
  coercivityKorn : Prop
  energyNormEquivalence : Prop

structure KornInequalityEvidence (K : KornInequalityPackage) where
  strainDisplacementRelationClosed : K.strainDisplacementRelation
  rigidMotionsKernelClosed : K.rigidMotionsKernel
  poincareInequalityClosed : K.poincareInequality
  coercivityKornClosed : K.coercivityKorn
  energyNormEquivalenceClosed : K.energyNormEquivalence

def KornInequalityClosed (K : KornInequalityPackage) : Prop :=
  K.strainDisplacementRelation ∧ K.rigidMotionsKernel ∧
  K.poincareInequality ∧ K.coercivityKorn ∧ K.energyNormEquivalence

theorem korn_inequality_closed_from_evidence (K : KornInequalityPackage)
    (Ev : KornInequalityEvidence K) : KornInequalityClosed K := by
  exact And.intro Ev.strainDisplacementRelationClosed
    (And.intro Ev.rigidMotionsKernelClosed
      (And.intro Ev.poincareInequalityClosed
        (And.intro Ev.coercivityKornClosed Ev.energyNormEquivalenceClosed)))

end ClassicalLinearElasticityCanonicalLaneLean
end HautevilleHouse
