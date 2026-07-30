import ViscousVortexFlowsCanonicalLaneLean.ViscousVortexCertificate

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

def ViscousVortexAdmittedClosure : Prop :=
  ViscousVortexCertificateClosed sourceViscousVortexCertificate ∧ ViscousVortexClosure vortexAdmissibleClass

def UnrestrictedClassicalVortexBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedNavierStokesStackCarried = true

theorem viscous_vortex_admitted_closure_checked :
    ViscousVortexAdmittedClosure := by
  exact And.intro source_viscous_vortex_certificate_closed (viscous_vortex_endgame vortexAdmissibleClass)

theorem unrestricted_classical_vortex_boundary_carried_checked :
    UnrestrictedClassicalVortexBoundaryCarried := by
  exact And.intro rfl rfl

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse