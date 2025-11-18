Theorem hello : forall (A : Prop), A -> A.
Proof.
  intros A H.
  exact H.
Qed.