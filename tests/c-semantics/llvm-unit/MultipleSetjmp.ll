; ModuleID = './MultipleSetjmp.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [15 x i8] c"Inside bar %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"returning from bar == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @bar(%struct.__jmp_buf_tag* %buf, i32 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.__jmp_buf_tag*, align 8
  %3 = alloca i32, align 4
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %2, align 8
  store i32 %i, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = load %struct.__jmp_buf_tag** %2, align 8
  %7 = load i32* %3, align 4
  call void @longjmp(%struct.__jmp_buf_tag* %6, i32 %7) #4
  unreachable
                                                  ; No predecessors!
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %ret = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %3 = call i32 @_setjmp(%struct.__jmp_buf_tag* %2) #5
  store i32 %3, i32* %ret, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %0
  %6 = load i32* %ret, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %8 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %9 = call i32 @_setjmp(%struct.__jmp_buf_tag* %8) #5
  store i32 %9, i32* %ret, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5
  %12 = load i32* %ret, align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %12)
  br label %17

; <label>:14                                      ; preds = %5
  %15 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %16 = call i32 @bar(%struct.__jmp_buf_tag* %15, i32 927)
  br label %17

; <label>:17                                      ; preds = %14, %11
  br label %21

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %20 = call i32 @bar(%struct.__jmp_buf_tag* %19, i32 37)
  br label %21

; <label>:21                                      ; preds = %18, %17
  %22 = load i32* %1
  ret i32 %22
}

; Function Attrs: nounwind returns_twice
declare i32 @_setjmp(%struct.__jmp_buf_tag*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind returns_twice "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind returns_twice }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
