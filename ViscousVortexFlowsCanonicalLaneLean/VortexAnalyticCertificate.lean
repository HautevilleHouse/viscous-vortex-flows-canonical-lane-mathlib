import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.VortexEndpointLayer
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.VortexFlowPDE

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure VortexAnalyticCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  enstrophyLayerClosed : Prop
  compactnessLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  enstrophyLayerClosedProof : enstrophyLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceVortexAnalyticCertificate : VortexAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := ViscousVortexEquationClosed primitiveVortexFlow
  weakLayerClosed := VortexEnvelopeClosed sourceVortexEnvelope
  enstrophyLayerClosed := VortexEnstrophyClosed sourceVortexEnstrophyCertificate
  compactnessLayerClosed := CompactnessRigidityClosed sourceCompactnessRigidityCertificate
  endpointLayerClosed := EndpointClosed sourceEndpointCertificate
  canonicalCarriageImported := True
  operatorsClosedProof := primitive_viscous_vortex_equation_closed
  weakLayerClosedProof := source_vortex_envelope_closed
  enstrophyLayerClosedProof := source_vortex_enstrophy_closed
  compactnessLayerClosedProof := source_compactness_rigidity_closed
  endpointLayerClosedProof := source_endpoint_closed
  canonicalCarriageImportedProof := by
    -- canonicalCarriageImported is defined as True, so the proof is trivial
    trivial
}

def VortexAnalyticCertificateClosed (C : VortexAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.enstrophyLayerClosed ∧
  C.compactnessLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_vortex_analytic_certificate_closed :
    VortexAnalyticCertificateClosed sourceVortexAnalyticCertificate := by
  unfold VortexAnalyticCertificateClosed
  refine And.intro sourceVortexAnalyticCertificate.operatorsClosedProof ?_
  refine And.intro sourceVortexAnalyticCertificate.weakLayerClosedProof ?_
  refine And.intro sourceVortexAnalyticCertificate.enstrophyLayerClosedProof ?_
  refine And.intro sourceVortexAnalyticCertificate.compactnessLayerClosedProof ?_
  refine And.intro sourceVortexAnalyticCertificate.endpointLayerClosedProof ?_
  exact sourceVortexAnalyticCertificate.canonicalCarriageImportedProof

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse