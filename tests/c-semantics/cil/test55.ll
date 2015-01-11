; ModuleID = './test55.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fun = type { i32 }

@a = global %struct.fun { i32 32 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @pfun2(%struct.fun** %z) #0 {
  %1 = alloca %struct.fun**, align 8
  store %struct.fun** %z, %struct.fun*** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @pfun(%struct.fun* %z) #0 {
  %1 = alloca %struct.fun*, align 8
  store %struct.fun* %z, %struct.fun** %1, align 8
  call void @pfun2(%struct.fun** %1)
  %2 = load %struct.fun** %1, align 8
  %3 = getelementptr inbounds %struct.fun* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %4)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @pfun(%struct.fun* @a)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
