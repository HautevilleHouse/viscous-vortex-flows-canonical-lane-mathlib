import ViscousVortexFlowsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse