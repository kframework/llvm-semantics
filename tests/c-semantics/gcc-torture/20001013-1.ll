; ModuleID = './20001013-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.x = type { i32, i32 }

@z = global %struct.x { i32 -4028, i32 4096 }, align 4

; Function Attrs: nounwind uwtable
define i32 @foo(%struct.x* %p, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.x*, align 8
  %3 = alloca i32, align 4
  store %struct.x* %p, %struct.x** %2, align 8
  store i32 %y, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 255
  %6 = load i32* %3, align 4
  %7 = icmp ne i32 %5, %6
  br i1 %7, label %17, label %8

; <label>:8                                       ; preds = %0
  %9 = load %struct.x** %2, align 8
  %10 = getelementptr inbounds %struct.x* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = sub nsw i32 0, %11
  %13 = load %struct.x** %2, align 8
  %14 = getelementptr inbounds %struct.x* %13, i32 0, i32 0
  %15 = load i32* %14, align 4
  %16 = icmp sge i32 %12, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %8, %0
  store i32 1, i32* %1
  br label %19

; <label>:18                                      ; preds = %8
  store i32 0, i32* %1
  br label %19

; <label>:19                                      ; preds = %18, %17
  %20 = load i32* %1
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(%struct.x* @z, i32 10)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
