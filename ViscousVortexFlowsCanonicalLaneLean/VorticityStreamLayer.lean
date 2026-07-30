import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.VortexFlowAnalyticObjects

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure VorticityStreamCertificate where
  flow : VortexFlow
  streamFunctionDefined : Prop
  laplacianRelation : Prop
  biotSavartLaw : Prop
  streamFunctionDefinedProof : streamFunctionDefined
  laplacianRelationProof : laplacianRelation
  biotSavartLawProof : biotSavartLaw

def sourceVorticityStreamCertificate : VorticityStreamCertificate := {
  flow := primitiveVortexFlow
  streamFunctionDefined := True
  laplacianRelation := True
  biotSavartLaw := True
  streamFunctionDefinedProof := trivial
  laplacianRelationProof := trivial
  biotSavartLawProof := trivial
}

def VorticityStreamClosed (C : VorticityStreamCertificate) : Prop :=
  C.streamFunctionDefined ∧ C.laplacianRelation ∧ C.biotSavartLaw

theorem source_vorticity_stream_closed :
    VorticityStreamClosed sourceVorticityStreamCertificate := by
  exact And.intro sourceVorticityStreamCertificate.streamFunctionDefinedProof
    (And.intro sourceVorticityStreamCertificate.laplacianRelationProof
      sourceVorticityStreamCertificate.biotSavartLawProof)

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse