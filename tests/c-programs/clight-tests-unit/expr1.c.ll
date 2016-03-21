; ModuleID = './expr1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list = type { i32, %struct.list* }

@.str = private unnamed_addr constant [21 x i8] c"VOLATILE Result: %p\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"BUG\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.list* @f(%struct.list** %p) #0 {
  %1 = alloca %struct.list**, align 8
  store %struct.list** %p, %struct.list*** %1, align 8
  %2 = load %struct.list**, %struct.list*** %1, align 8
  %3 = load %struct.list*, %struct.list** %2, align 8
  %4 = getelementptr inbounds %struct.list, %struct.list* %3, i32 0, i32 1
  store %struct.list* null, %struct.list** %4, align 8
  ret %struct.list* null
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %l = alloca %struct.list, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = getelementptr inbounds %struct.list, %struct.list* %l, i32 0, i32 1
  store %struct.list* %l, %struct.list** %4, align 8
  %5 = getelementptr inbounds %struct.list, %struct.list* %l, i32 0, i32 1
  %6 = call %struct.list* @f(%struct.list** %5)
  %7 = getelementptr inbounds %struct.list, %struct.list* %l, i32 0, i32 1
  %8 = load %struct.list*, %struct.list** %7, align 8
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), %struct.list* %8)
  %10 = getelementptr inbounds %struct.list, %struct.list* %l, i32 0, i32 1
  %11 = load %struct.list*, %struct.list** %10, align 8
  %12 = icmp ne %struct.list* %11, null
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %0
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  br label %15

; <label>:15                                      ; preds = %13, %0
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
