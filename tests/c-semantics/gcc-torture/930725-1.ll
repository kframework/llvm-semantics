; ModuleID = './930725-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@v = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

; Function Attrs: nounwind uwtable
define i8* @g() #0 {
  ret i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define i8* @f() #0 {
  %1 = load i32* @v, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = call i8* @g()
  br label %6

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = phi i8* [ %4, %3 ], [ getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), %5 ]
  ret i8* %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* @v, align 4
  %2 = call i8* @f()
  %3 = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0)) #3
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #4
  unreachable

; <label>:6                                       ; preds = %0
  call void @abort() #4
  unreachable
                                                  ; No predecessors!
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
