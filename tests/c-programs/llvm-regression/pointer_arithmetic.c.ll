; ModuleID = './pointer_arithmetic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S1Ty = type { i32 }
%struct.S2Ty = type { %struct.S1Ty, %struct.S1Ty }

; Function Attrs: nounwind uwtable
define void @takeS1(%struct.S1Ty* %V) #0 {
  %1 = alloca %struct.S1Ty*, align 8
  store %struct.S1Ty* %V, %struct.S1Ty** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @takeVoid(i8* %P) #0 {
  %1 = alloca i8*, align 8
  store i8* %P, i8** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %E = alloca %struct.S2Ty, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.S2Ty, %struct.S2Ty* %E, i32 0, i32 1
  call void @takeS1(%struct.S1Ty* %2)
  %3 = bitcast %struct.S2Ty* %E to i8*
  call void @takeVoid(i8* %3)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
