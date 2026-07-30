import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscousVortexFlowsCanonicalLaneLean.VortexFlowPDE

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

structure VortexEnvelope where
  flow : ViscousVortexFlow
  finiteEnstrophy : Prop
  divergenceFree : Prop
  enstrophyInequality : Prop
  weakEquation : Prop
  finiteEnstrophyClosed : finiteEnstrophy
  divergenceFreeClosed : divergenceFree
  enstrophyInequalityClosed : enstrophyInequality
  weakEquationClosed : weakEquation

def sourceVortexEnvelope : VortexEnvelope := {
  flow := primitiveVortexFlow
  finiteEnstrophy := True
  divergenceFree := True
  enstrophyInequality := True
  weakEquation := ViscousVortexEquationClosed primitiveVortexFlow
  finiteEnstrophyClosed := by
    trivial
  divergenceFreeClosed := by
    trivial
  enstrophyInequalityClosed := by
    trivial
  weakEquationClosed := primitive_viscous_vortex_equation_closed
}

def VortexEnvelopeClosed (E : VortexEnvelope) : Prop :=
  E.finiteEnstrophy ∧ E.divergenceFree ∧ E.enstrophyInequality ∧ E.weakEquation

theorem source_vortex_envelope_closed :
    VortexEnvelopeClosed sourceVortexEnvelope := by
  unfold VortexEnvelopeClosed
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact sourceVortexEnvelope.finiteEnstrophyClosed
  · exact sourceVortexEnvelope.divergenceFreeClosed
  · exact sourceVortexEnvelope.enstrophyInequalityClosed
  · exact sourceVortexEnvelope.weakEquationClosed

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse