; ModuleID = './structLinkedList.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %curr = alloca %struct.list_el*, align 8
  %head = alloca %struct.list_el*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store %struct.list_el* null, %struct.list_el** %head, align 8
  store i32 1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %15, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp sle i32 %3, 10
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %2
  %6 = call noalias i8* @malloc(i64 16) #3
  %7 = bitcast i8* %6 to %struct.list_el*
  store %struct.list_el* %7, %struct.list_el** %curr, align 8
  %8 = load i32, i32* %i, align 4
  %9 = load %struct.list_el*, %struct.list_el** %curr, align 8
  %10 = getelementptr inbounds %struct.list_el, %struct.list_el* %9, i32 0, i32 0
  store i32 %8, i32* %10, align 4
  %11 = load %struct.list_el*, %struct.list_el** %head, align 8
  %12 = load %struct.list_el*, %struct.list_el** %curr, align 8
  %13 = getelementptr inbounds %struct.list_el, %struct.list_el* %12, i32 0, i32 1
  store %struct.list_el* %11, %struct.list_el** %13, align 8
  %14 = load %struct.list_el*, %struct.list_el** %curr, align 8
  store %struct.list_el* %14, %struct.list_el** %head, align 8
  br label %15

; <label>:15                                      ; preds = %5
  %16 = load i32, i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %2

; <label>:18                                      ; preds = %2
  %19 = load %struct.list_el*, %struct.list_el** %head, align 8
  store %struct.list_el* %19, %struct.list_el** %curr, align 8
  br label %20

; <label>:20                                      ; preds = %23, %18
  %21 = load %struct.list_el*, %struct.list_el** %curr, align 8
  %22 = icmp ne %struct.list_el* %21, null
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %20
  %24 = load %struct.list_el*, %struct.list_el** %curr, align 8
  %25 = getelementptr inbounds %struct.list_el, %struct.list_el* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %26)
  %28 = load %struct.list_el*, %struct.list_el** %curr, align 8
  %29 = getelementptr inbounds %struct.list_el, %struct.list_el* %28, i32 0, i32 1
  %30 = load %struct.list_el*, %struct.list_el** %29, align 8
  store %struct.list_el* %30, %struct.list_el** %curr, align 8
  br label %20

; <label>:31                                      ; preds = %20
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
