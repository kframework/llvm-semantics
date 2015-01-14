; ModuleID = './950426-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tag = type { i32, [5 x i8*] }

@s1 = common global %struct.tag zeroinitializer, align 8
@p1 = common global %struct.tag* null, align 8
@.str = private unnamed_addr constant [3 x i8] c"ok\00", align 1
@i = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"123\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -1, i32* getelementptr inbounds (%struct.tag* @s1, i32 0, i32 0), align 4
  store %struct.tag* @s1, %struct.tag** @p1, align 8
  %2 = load %struct.tag** @p1, align 8
  %3 = getelementptr inbounds %struct.tag* %2, i32 0, i32 0
  %4 = call i32 @func1(i32* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @foo(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %8

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %6
  store i32 3, i32* @i, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i8** getelementptr inbounds (%struct.tag* @s1, i32 0, i32 1, i64 3), align 8
  %9 = load i32* @i, align 4
  %10 = sext i32 %9 to i64
  %11 = load %struct.tag** @p1, align 8
  %12 = getelementptr inbounds %struct.tag* %11, i32 0, i32 1
  %13 = getelementptr inbounds [5 x i8*]* %12, i32 0, i64 %10
  %14 = load i8** %13, align 8
  %15 = getelementptr inbounds i8* %14, i32 1
  store i8* %15, i8** %13, align 8
  %16 = call i64 @strlen(i8* %14) #4
  %17 = icmp eq i64 %16, 3
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %8
  call void @foo(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %20

; <label>:19                                      ; preds = %8
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %18
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %22 = load i32* %1
  ret i32 %22
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @func1(i32* %p) #0 {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = load i32* %2, align 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define void @foo(i8* %s) #0 {
  %1 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
