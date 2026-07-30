import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ViscousVortexFlowsCanonicalLaneLean

abbrev Space2 := Fin 2 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space2 → ℝ
abbrev VectorField := Time → Space2 → Space2

structure VortexFlowOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  vortexStretching : VectorField → VectorField
  viscousTerm : VectorField → VectorField
  vortexStretchingIdempotent : ∀ ω, vortexStretching (vortexStretching ω) = vortexStretching ω

def primitiveVortexOperators : VortexFlowOperators := {
  divergence := fun _ => λ _ _ => 0
  gradient := fun _ => λ _ _ _ => (0,0)
  laplacian := fun ω => ω
  timeDerivative := fun _ => λ _ _ _ => (0,0)
  transport := fun _ => λ _ _ _ => (0,0)
  vortexStretching := fun ω => ω
  viscousTerm := fun ω => ω
  vortexStretchingIdempotent := by
    intro ω
    rfl
}

structure VortexFlow where
  vorticity : VectorField
  velocity : VectorField
  viscosity : ℝ
  operators : VortexFlowOperators

def primitiveVortexFlow : VortexFlow := {
  vorticity := λ _ _ _ => (0,0)
  velocity := λ _ _ _ => (0,0)
  viscosity := 1
  operators := primitiveVortexOperators
}

def VorticityEquation (F : VortexFlow) : Prop :=
  F.operators.timeDerivative F.vorticity = F.operators.transport F.vorticity


end ViscousVortexFlowsCanonicalLaneLean
end HautevilleHouse