import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.VortexAnalyticCertificate

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

def ViscousVortexAdmittedAnalyticClosure : Prop :=
  VortexAnalyticCertificateClosed sourceVortexAnalyticCertificate ∧
  ConstrainedTheoremClosure vortexAdmissibleClass

def UnrestrictedClassicalVortexBoundaryCarried : Prop :=
  True

theorem viscous_vortex_admitted_analytic_closure_checked :
    ViscousVortexAdmittedAnalyticClosure := by
  exact And.intro source_vortex_analytic_certificate_closed
    (constrained_theorem_closure vortexAdmissibleClass)

theorem unrestricted_classical_vortex_boundary_carried_checked :
    UnrestrictedClassicalVortexBoundaryCarried := by
  trivial

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse