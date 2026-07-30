import ViscousVortexFlowsCanonicalLaneLean.VorticityConfinementLayer

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure ViscousVortexCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  vorticityClosed : Prop
  confinementClosed : Prop
  operatorsClosedProof : operatorsClosed
  vorticityClosedProof : vorticityClosed
  confinementClosedProof : confinementClosed

def sourceViscousVortexCertificate : ViscousVortexCertificate :=
  { substrate := mathlibPDESubstrate
    operatorsClosed := ViscousVortexEquationClosed primitiveVortexFlow
    vorticityClosed := VorticityLayerClosed sourceVorticityCertificate
    confinementClosed := ConfinementLayerClosed sourceConfinementCertificate
    operatorsClosedProof := primitive_vortex_equation_closed_checked
    vorticityClosedProof := source_vorticity_layer_closed
    confinementClosedProof := source_confinement_layer_closed
  }

def ViscousVortexCertificateClosed (C : ViscousVortexCertificate) : Prop :=
  C.operatorsClosed ∧ C.vorticityClosed ∧ C.confinementClosed

theorem source_viscous_vortex_certificate_closed :
    ViscousVortexCertificateClosed sourceViscousVortexCertificate := by
  exact And.intro sourceViscousVortexCertificate.operatorsClosedProof (And.intro sourceViscousVortexCertificate.vorticityClosedProof sourceViscousVortexCertificate.confinementClosedProof)

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse