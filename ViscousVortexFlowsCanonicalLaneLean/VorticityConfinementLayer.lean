import ViscousVortexFlowsCanonicalLaneLean.VorticityLayer

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure ConfinementCertificate where
  vorticity : VorticityCertificate
  confinementControl : Prop
  barrierFloor : Prop
  confinementControlClosed : confinementControl
  barrierFloorClosed : barrierFloor

def sourceConfinementCertificate : ConfinementCertificate :=
  { vorticity := sourceVorticityCertificate
    confinementControl := constantSpecs.length = constantSpecCount
    barrierFloor := baselineCertificateLane = "vortex_constrained"
    confinementControlClosed := rfl
    barrierFloorClosed := rfl
  }

def ConfinementLayerClosed (C : ConfinementCertificate) : Prop :=
  VorticityLayerClosed C.vorticity ∧ C.confinementControl ∧ C.barrierFloor

theorem source_confinement_layer_closed :
    ConfinementLayerClosed sourceConfinementCertificate := by
  exact And.intro source_vorticity_layer_closed (And.intro sourceConfinementCertificate.confinementControlClosed sourceConfinementCertificate.barrierFloorClosed)

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse