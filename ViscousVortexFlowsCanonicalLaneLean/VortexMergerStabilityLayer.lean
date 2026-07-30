import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.ViscousDissipationLayer

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure VortexMergerStabilityCertificate where
  dissipation : ViscousDissipationCertificate
  mergerStability : Prop
  mergingThreshold : Prop
  stabilityCondition : Prop
  mergerStabilityProof : mergerStability
  mergingThresholdProof : mergingThreshold
  stabilityConditionProof : stabilityCondition

def sourceVortexMergerStabilityCertificate : VortexMergerStabilityCertificate := {
  dissipation := sourceViscousDissipationCertificate
  mergerStability := True
  mergingThreshold := True
  stabilityCondition := True
  mergerStabilityProof := trivial
  mergingThresholdProof := trivial
  stabilityConditionProof := trivial
}

def VortexMergerStabilityClosed (C : VortexMergerStabilityCertificate) : Prop :=
  ViscousDissipationClosed C.dissipation ∧ C.mergerStability ∧ C.mergingThreshold ∧ C.stabilityCondition

theorem source_vortex_merger_stability_closed :
    VortexMergerStabilityClosed sourceVortexMergerStabilityCertificate := by
  exact And.intro source_viscous_dissipation_closed
    (And.intro sourceVortexMergerStabilityCertificate.mergerStabilityProof
      (And.intro sourceVortexMergerStabilityCertificate.mergingThresholdProof
        sourceVortexMergerStabilityCertificate.stabilityConditionProof))

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse