; ModuleID = './20040625-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type <{ %struct.s* }>

; Function Attrs: noinline nounwind uwtable
define %struct.s* @maybe_next(%struct.s* %s, i32 %t) #0 {
  %1 = alloca %struct.s*, align 8
  %2 = alloca i32, align 4
  store %struct.s* %s, %struct.s** %1, align 8
  store i32 %t, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = load %struct.s** %1, align 8
  %7 = getelementptr inbounds %struct.s* %6, i32 0, i32 0
  %8 = load %struct.s** %7, align 1
  store %struct.s* %8, %struct.s** %1, align 8
  br label %9

; <label>:9                                       ; preds = %5, %0
  %10 = load %struct.s** %1, align 8
  ret %struct.s* %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %s1 = alloca %struct.s, align 1
  %s2 = alloca %struct.s, align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.s* %s1, i32 0, i32 0
  store %struct.s* %s2, %struct.s** %2, align 1
  %3 = call %struct.s* @maybe_next(%struct.s* %s1, i32 1)
  %4 = icmp ne %struct.s* %3, %s2
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
