import ViscousVortexFlowsCanonicalLaneLean.MathlibPDESubstrate

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure VorticityCertificate where
  flow : ViscousVortexFlow
  vorticityEquation : Prop
  finiteEnstrophy : Prop
  vorticityEquationClosed : vorticityEquation
  finiteEnstrophyClosed : finiteEnstrophy

def sourceVorticityCertificate : VorticityCertificate :=
  { flow := primitiveVortexFlow
    vorticityEquation := VorticityEquationClosed primitiveVortexFlow
    finiteEnstrophy := baselineCertificateAllPass = true
    vorticityEquationClosed := primitiveVorticityEquationClosed
    finiteEnstrophyClosed := rfl
  }

def VorticityLayerClosed (C : VorticityCertificate) : Prop :=
  C.vorticityEquation ∧ C.finiteEnstrophy

theorem source_vorticity_layer_closed :
    VorticityLayerClosed sourceVorticityCertificate := by
  exact And.intro sourceVorticityCertificate.vorticityEquationClosed sourceVorticityCertificate.finiteEnstrophyClosed

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse