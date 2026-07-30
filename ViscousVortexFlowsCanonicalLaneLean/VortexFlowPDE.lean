import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

abbrev Space2 := Fin 2 → ℝ
abbrev Time := ℝ
abbrev StreamFunction := Time → Space2 → ℝ
abbrev Vorticity := Time → Space2 → ℝ
type _root_.RealPF

def zeroStream : StreamFunction := fun _ _ => 0
def zeroVorticity : Vorticity := fun _ _ => 0

structure ViscousVortexOperators where
  laplacian : StreamFunction → Vorticity
  timeDerivative : Vorticity → Vorticity
  advection : Vorticity → Vorticity
  diffusion : Vorticity → Vorticity
  vorticityToStream : Vorticity → StreamFunction
  advectionBilinear : Vorticity → StreamFunction → Vorticity

def primitiveVortexOperators : ViscousVortexOperators := {
  laplacian := fun psi => zeroVorticity
  timeDerivative := fun w => zeroVorticity
  advection := fun w => zeroVorticity
  diffusion := fun w => zeroVorticity
  vorticityToStream := fun w => zeroStream
  advectionBilinear := fun w psi => zeroVorticity
}

structure ViscousVortexFlow where
  vorticity : Vorticity
  stream : StreamFunction
  viscosity : ℝ
  operators : ViscousVortexOperators

def primitiveVortexFlow : ViscousVortexFlow := {
  vorticity := zeroVorticity
  stream := zeroStream
  viscosity := 1
  operators := primitiveVortexOperators
}

def VorticityTransportClosed (F : ViscousVortexFlow) : Prop :=
  F.operators.timeDerivative F.vorticity = F.operators.diffusion F.vorticity

def StreamLaplacianClosed (F : ViscousVortexFlow) : Prop :=
  F.operators.laplacian F.stream = F.vorticity

def AdvectionClosed (F : ViscousVortexFlow) : Prop :=
  F.operators.advection F.vorticity = zeroVorticity

def ViscousVortexEquationClosed (F : ViscousVortexFlow) : Prop :=
  VorticityTransportClosed F ∧ StreamLaplacianClosed F ∧ AdvectionClosed F

theorem primitive_vorticity_transport_closed :
    VorticityTransportClosed primitiveVortexFlow := by
  unfold VorticityTransportClosed primitiveVortexFlow primitiveVortexOperators
  simp

theorem primitive_stream_laplacian_closed :
    StreamLaplacianClosed primitiveVortexFlow := by
  unfold StreamLaplacianClosed primitiveVortexFlow primitiveVortexOperators
  simp

theorem primitive_advection_closed :
    AdvectionClosed primitiveVortexFlow := by
  unfold AdvectionClosed primitiveVortexFlow primitiveVortexOperators
  simp

theorem primitive_viscous_vortex_equation_closed :
    ViscousVortexEquationClosed primitiveVortexFlow := by
  refine And.intro primitive_vorticity_transport_closed ?_
  exact And.intro primitive_stream_laplacian_closed primitive_advection_closed

end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse