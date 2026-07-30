import canonicalLaneMathlib.AdmissibleClass
import ViscousVortexFlowsCanonicalLaneLean.VortexRegularityLayer

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

def ConstrainedVortexClosure (A : VortexAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vortex_endgame (A : VortexAdmissibleClass) :
    ConstrainedVortexClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

-- Global closure: certificate endorses admissible class closure
def ViscousVortexAdmittedClosure : Prop :=
  VortexRegularityClosed sourceVortexRegularityCertificate ∧
  ConstrainedVortexClosure primitiveVortexAdmissibleClass

theorem viscous_vortex_admitted_closure_checked :
    ViscousVortexAdmittedClosure := by
  exact And.intro source_vortex_regularity_closed
    (constrained_vortex_endgame primitiveVortexAdmissibleClass)

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse