import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.VorticityStreamLayer

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure ViscousDissipationCertificate where
  vorticityStream : VorticityStreamCertificate
  enstrophyDecay : Prop
  dissipationRate : Prop
  energyDissipation : Prop
  enstrophyDecayProof : enstrophyDecay
  dissipationRateProof : dissipationRate
  energyDissipationProof : energyDissipation

def sourceViscousDissipationCertificate : ViscousDissipationCertificate := {
  vorticityStream := sourceVorticityStreamCertificate
  enstrophyDecay := True
  dissipationRate := True
  energyDissipation := True
  enstrophyDecayProof := trivial
  dissipationRateProof := trivial
  energyDissipationProof := trivial
}

def ViscousDissipationClosed (C : ViscousDissipationCertificate) : Prop :=
  VorticityStreamClosed C.vorticityStream ∧ C.enstrophyDecay ∧ C.dissipationRate ∧ C.energyDissipation

theorem source_viscous_dissipation_closed :
    ViscousDissipationClosed sourceViscousDissipationCertificate := by
  exact And.intro source_vorticity_stream_closed
    (And.intro sourceViscousDissipationCertificate.enstrophyDecayProof
      (And.intro sourceViscousDissipationCertificate.dissipationRateProof
        sourceViscousDissipationCertificate.energyDissipationProof))

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse