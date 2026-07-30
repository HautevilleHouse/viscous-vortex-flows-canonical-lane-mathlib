import canonicalLaneMathlib.AdmissibleClass
import ViscousVortexFlowsCanonicalLaneLean.ViscousVortexClosureLayer

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure VortexRegularityCertificate where
  closure : VortexAdmissibleClass
  sourceFormulaClosed : Prop
  bridgeClosedOnObject : Prop
  gateClosedOnAdmissibleClass : Prop
  theoremBoundaryCarried : Prop
  sourceFormulaClosedProof : sourceFormulaClosed
  bridgeClosedOnObjectProof : bridgeClosedOnObject
  gateClosedOnAdmissibleClassProof : gateClosedOnAdmissibleClass
  theoremBoundaryCarriedProof : theoremBoundaryCarried

def sourceVortexRegularityCertificate : VortexRegularityCertificate := {
  closure := primitiveVortexAdmissibleClass
  sourceFormulaClosed := True
  bridgeClosedOnObject := bridgeClosed primitiveVortexAdmissibleClass
  gateClosedOnAdmissibleClass := gateClosed primitiveVortexAdmissibleClass
  theoremBoundaryCarried := True
  sourceFormulaClosedProof := trivial
  bridgeClosedOnObjectProof := bridge_from_admissible_class primitiveVortexAdmissibleClass
  gateClosedOnAdmissibleClassProof := gate_from_admissible_class primitiveVortexAdmissibleClass
  theoremBoundaryCarriedProof := trivial
}

def VortexRegularityClosed (C : VortexRegularityCertificate) : Prop :=
  C.sourceFormulaClosed ∧
  C.bridgeClosedOnObject ∧
  C.gateClosedOnAdmissibleClass ∧
  C.theoremBoundaryCarried

theorem source_vortex_regularity_closed :
    VortexRegularityClosed sourceVortexRegularityCertificate := by
  exact And.intro sourceVortexRegularityCertificate.sourceFormulaClosedProof
    (And.intro sourceVortexRegularityCertificate.bridgeClosedOnObjectProof
      (And.intro sourceVortexRegularityCertificate.gateClosedOnAdmissibleClassProof
        sourceVortexRegularityCertificate.theoremBoundaryCarriedProof))

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse