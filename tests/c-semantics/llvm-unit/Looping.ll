; ModuleID = './Looping.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [9 x i8] c"i == %u\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store volatile i32 0, i32* %i, align 4
  %2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %3 = call i32 @_setjmp(%struct.__jmp_buf_tag* %2) #4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = load volatile i32* %i, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %9 = load volatile i32* %i, align 4
  %10 = add i32 %9, 1
  store volatile i32 %10, i32* %i, align 4
  call void @longjmp(%struct.__jmp_buf_tag* %8, i32 %10) #5
  unreachable

; <label>:11                                      ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind returns_twice
declare i32 @_setjmp(%struct.__jmp_buf_tag*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind returns_twice "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind returns_twice }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
