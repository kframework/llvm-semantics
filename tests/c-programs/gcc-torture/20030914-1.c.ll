; ModuleID = './20030914-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { [16 x i32] }

; Function Attrs: nounwind uwtable
define x86_fp80 @f(i32 %pa, %struct.s* byval align 8 %pb, x86_fp80 %pc) #0 {
  %1 = alloca i32, align 4
  %2 = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  store i32 %pa, i32* %1, align 4
  store x86_fp80 %pc, x86_fp80* %2, align 16
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 16
  br i1 %5, label %6, label %18

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds %struct.s, %struct.s* %pb, i32 0, i32 0
  %10 = getelementptr inbounds [16 x i32], [16 x i32]* %9, i32 0, i64 %8
  %11 = load i32, i32* %10, align 4
  %12 = sitofp i32 %11 to x86_fp80
  %13 = load x86_fp80, x86_fp80* %2, align 16
  %14 = fadd x86_fp80 %13, %12
  store x86_fp80 %14, x86_fp80* %2, align 16
  br label %15

; <label>:15                                      ; preds = %6
  %16 = load i32, i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %3

; <label>:18                                      ; preds = %3
  %19 = load x86_fp80, x86_fp80* %2, align 16
  ret x86_fp80 %19
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.s, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 16
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = add nsw i32 %6, 1
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.s, %struct.s* %x, i32 0, i32 0
  %11 = getelementptr inbounds [16 x i32], [16 x i32]* %10, i32 0, i64 %9
  store i32 %7, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  %16 = call x86_fp80 @f(i32 1, %struct.s* byval align 8 %x, x86_fp80 0xK400C9C40000000000000)
  %17 = fcmp une x86_fp80 %16, 0xK400C9E60000000000000
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %21 = load i32, i32* %1
  ret i32 %21
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
