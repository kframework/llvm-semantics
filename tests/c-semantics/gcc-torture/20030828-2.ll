; ModuleID = './20030828-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rtx_def = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %tmp = alloca [2 x i32], align 4
  %r = alloca %struct.rtx_def*, align 8
  %s = alloca %struct.rtx_def, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32 0, i32* %1
  store %struct.rtx_def* %s, %struct.rtx_def** %r, align 8
  %2 = load %struct.rtx_def** %r, align 8
  %3 = getelementptr inbounds %struct.rtx_def* %2, i32 0, i32 0
  store i32 39, i32* %3, align 4
  %4 = getelementptr inbounds [2 x i32]* %tmp, i32 0, i32 0
  store i32* %4, i32** %p, align 8
  %5 = load i32** %p, align 8
  %6 = getelementptr inbounds i32* %5, i64 1
  store i32* %6, i32** %q, align 8
  %7 = load i32** %q, align 8
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds [2 x i32]* %tmp, i32 0, i64 1
  store i32 39, i32* %8, align 4
  %9 = load i32** %q, align 8
  %10 = load i32* %9, align 4
  %11 = icmp ne i32 %10, 39
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
