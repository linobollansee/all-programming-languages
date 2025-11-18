theorem hello (p : Prop) : p → p :=
fun hp => hp

#check hello