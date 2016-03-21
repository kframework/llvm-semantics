; ModuleID = './980506-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.decision = type { i8, %struct.decision* }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca %struct.decision*, align 8
  store i32 0, i32* %1
  store %struct.decision* null, %struct.decision** %p, align 8
  %2 = load %struct.decision*, %struct.decision** %p, align 8
  call void @clear_modes(%struct.decision* %2)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %4 = load i32, i32* %1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define internal void @clear_modes(%struct.decision* %p) #0 {
  %1 = alloca %struct.decision*, align 8
  store %struct.decision* %p, %struct.decision** %1, align 8
  br label %5

; <label>:2                                       ; preds = %8
  %3 = load %struct.decision*, %struct.decision** %1, align 8
  %4 = getelementptr inbounds %struct.decision, %struct.decision* %3, i32 0, i32 0
  store i8 0, i8* %4, align 1
  br label %5

; <label>:5                                       ; preds = %2, %0
  %6 = load %struct.decision*, %struct.decision** %1, align 8
  %7 = icmp ne %struct.decision* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  br label %2

; <label>:9                                       ; preds = %5
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
