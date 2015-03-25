; ModuleID = './const-addr-expr-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo = type { i32, i8* }

@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@Upgrade_items = global [3 x %struct.foo] [%struct.foo { i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0) }, %struct.foo { i32 2, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0) }, %struct.foo zeroinitializer], align 16
@Upgd_minor_ID = global i32* bitcast (i8* getelementptr (i8* bitcast ([3 x %struct.foo]* @Upgrade_items to i8*), i64 16) to i32*), align 8
@Upgd_minor_ID1 = global i32* getelementptr inbounds ([3 x %struct.foo]* @Upgrade_items, i32 0, i32 0, i32 0), align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32** @Upgd_minor_ID, align 8
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 2
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load i32** @Upgd_minor_ID1, align 8
  %10 = load i32* %9, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %8
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
