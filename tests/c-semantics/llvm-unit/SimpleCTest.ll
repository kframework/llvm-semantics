; ModuleID = './SimpleCTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [12 x i8] c"Inside baz\0A\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"Inside main\0A\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"ret == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @baz(%struct.__jmp_buf_tag* %buf) #0 {
  %1 = alloca %struct.__jmp_buf_tag*, align 8
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %1, align 8
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0))
  %3 = load %struct.__jmp_buf_tag** %1, align 8
  call void @longjmp(%struct.__jmp_buf_tag* %3, i32 37) #4
  unreachable
                                                  ; No predecessors!
  ret void
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
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str1, i32 0, i32 0))
  %3 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %4 = call i32 @_setjmp(%struct.__jmp_buf_tag* %3) #5
  store i32 %4, i32* %ret, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %ret, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), i32 %7)
  br label %11

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  call void @baz(%struct.__jmp_buf_tag* %10)
  br label %11

; <label>:11                                      ; preds = %9, %6
  ret i32 0
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
