; ModuleID = './longjump.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [6 x i8] c"in f\0A\00", align 1
@x = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [8 x i8] c"second\0A\00", align 1
@buf = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [7 x i8] c"first\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"after jump\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"calling f\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"zzz\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"error code = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"xxx\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"test2\0A\00", align 1
@env = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str.9 = private unnamed_addr constant [20 x i8] c"setjmp returned %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"in foo\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Hello World\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"data = %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [12 x i8] c"in handler\0A\00", align 1
@.str.14 = private unnamed_addr constant [12 x i8] c"data freed\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0))
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @x, i32 0, i32 0), i32 5) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #2

; Function Attrs: nounwind uwtable
define void @second() #0 {
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @buf, i32 0, i32 0), i32 1) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @first() #0 {
  call void @second()
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @test1() #0 {
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %1 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @x, i32 0, i32 0)) #6
  store i32 %1, i32* %i, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  %3 = load i32, i32* %i, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0))
  call void @f()
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  br label %11

; <label>:8                                       ; preds = %0
  %9 = load i32, i32* %i, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i32 %9)
  br label %11

; <label>:11                                      ; preds = %8, %5
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind returns_twice
declare i32 @_setjmp(%struct.__jmp_buf_tag*) #3

; Function Attrs: nounwind uwtable
define void @test2() #0 {
  %1 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @buf, i32 0, i32 0)) #6
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  call void @first()
  br label %6

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %4, %3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @test3() #0 {
  %data = alloca i8*, align 8
  %res = alloca i32, align 4
  store i8* null, i8** %data, align 8
  %1 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @env, i32 0, i32 0)) #6
  store i32 %1, i32* %res, align 4
  %2 = load i32, i32* %res, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i32 %2)
  %4 = load i32, i32* %res, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @foo(i8** %data)
  br label %9

; <label>:7                                       ; preds = %0
  %8 = load i8*, i8** %data, align 8
  call void @handle(i8* %8)
  br label %9

; <label>:9                                       ; preds = %7, %6
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @foo(i8** %data) #0 {
  %1 = alloca i8**, align 8
  store i8** %data, i8*** %1, align 8
  %2 = call noalias i8* @malloc(i64 32) #7
  %3 = load i8**, i8*** %1, align 8
  store i8* %2, i8** %3, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0))
  %5 = load i8**, i8*** %1, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = call i8* @strcpy(i8* %6, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0)) #7
  %8 = load i8**, i8*** %1, align 8
  %9 = load i8*, i8** %8, align 8
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i8* %9)
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @env, i32 0, i32 0), i32 42) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @handle(i8* %data) #0 {
  %1 = alloca i8*, align 8
  store i8* %data, i8** %1, align 8
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i32 0, i32 0))
  %3 = load i8*, i8** %1, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** %1, align 8
  call void @free(i8* %6) #7
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i32 0, i32 0))
  br label %8

; <label>:8                                       ; preds = %5, %0
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test1()
  call void @test2()
  %2 = call i32 @test3()
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind returns_twice "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind returns_twice }
attributes #7 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
