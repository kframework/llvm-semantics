; ModuleID = './FarJump.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [13 x i8] c"Inside quux\0A\00", align 1
@.str1 = private unnamed_addr constant [27 x i8] c"Longjmping from quux: 927\0A\00", align 1
@.str2 = private unnamed_addr constant [12 x i8] c"Inside qux\0A\00", align 1
@.str3 = private unnamed_addr constant [33 x i8] c"Error: Shouldn't be here in qux\0A\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"Inside baz\0A\00", align 1
@.str5 = private unnamed_addr constant [33 x i8] c"Error: Shouldn't be here in baz\0A\00", align 1
@.str6 = private unnamed_addr constant [12 x i8] c"Inside bar\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"Inside foo\0A\00", align 1
@.str8 = private unnamed_addr constant [33 x i8] c"Returning from longjmp into foo\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @quux(%struct.__jmp_buf_tag* %buf) #0 {
  %1 = alloca %struct.__jmp_buf_tag*, align 8
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %1, align 8
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0))
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0))
  %4 = load %struct.__jmp_buf_tag** %1, align 8
  call void @longjmp(%struct.__jmp_buf_tag* %4, i32 927) #4
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #2

; Function Attrs: nounwind uwtable
define void @qux(%struct.__jmp_buf_tag* %buf) #0 {
  %1 = alloca %struct.__jmp_buf_tag*, align 8
  %local_buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %1, align 8
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str2, i32 0, i32 0))
  %3 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %local_buf, i32 0, i32 0
  %4 = call i32 @_setjmp(%struct.__jmp_buf_tag* %3) #5
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct.__jmp_buf_tag** %1, align 8
  call void @quux(%struct.__jmp_buf_tag* %7)
  br label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str3, i32 0, i32 0))
  br label %10

; <label>:10                                      ; preds = %8, %6
  ret void
}

; Function Attrs: nounwind returns_twice
declare i32 @_setjmp(%struct.__jmp_buf_tag*) #3

; Function Attrs: nounwind uwtable
define void @baz(%struct.__jmp_buf_tag* %buf) #0 {
  %1 = alloca %struct.__jmp_buf_tag*, align 8
  %local_buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %1, align 8
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0))
  %3 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %local_buf, i32 0, i32 0
  %4 = call i32 @_setjmp(%struct.__jmp_buf_tag* %3) #5
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct.__jmp_buf_tag** %1, align 8
  call void @qux(%struct.__jmp_buf_tag* %7)
  br label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0))
  br label %10

; <label>:10                                      ; preds = %8, %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(%struct.__jmp_buf_tag* %buf) #0 {
  %1 = alloca %struct.__jmp_buf_tag*, align 8
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %1, align 8
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0))
  %3 = load %struct.__jmp_buf_tag** %1, align 8
  call void @baz(%struct.__jmp_buf_tag* %3)
  ret void
}

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0))
  %2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %3 = call i32 @_setjmp(%struct.__jmp_buf_tag* %2) #5
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  call void @bar(%struct.__jmp_buf_tag* %6)
  br label %9

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str8, i32 0, i32 0))
  br label %9

; <label>:9                                       ; preds = %7, %5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind returns_twice "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind returns_twice }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
