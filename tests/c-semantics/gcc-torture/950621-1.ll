; ModuleID = './950621-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32, i32, %struct.s* }

; Function Attrs: nounwind uwtable
define i32 @f(%struct.s* %sp) #0 {
  %1 = alloca %struct.s*, align 8
  store %struct.s* %sp, %struct.s** %1, align 8
  %2 = load %struct.s** %1, align 8
  %3 = icmp ne %struct.s* %2, null
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %0
  %5 = load %struct.s** %1, align 8
  %6 = getelementptr inbounds %struct.s* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %4
  %10 = load %struct.s** %1, align 8
  %11 = getelementptr inbounds %struct.s* %10, i32 0, i32 1
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, -1
  br label %14

; <label>:14                                      ; preds = %9, %4, %0
  %15 = phi i1 [ false, %4 ], [ false, %0 ], [ %13, %9 ]
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.s, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.s* %x, i32 0, i32 1
  store i32 -1, i32* %2, align 4
  %3 = getelementptr inbounds %struct.s* %x, i32 0, i32 0
  store i32 -1, i32* %3, align 4
  %4 = call i32 @f(%struct.s* %x)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %9 = load i32* %1
  ret i32 %9
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
