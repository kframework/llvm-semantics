; ModuleID = './divconst-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.t1 = type { i32, i32, i32, i32 }

; Function Attrs: nounwind uwtable
define void @f(%struct.t1* %ps) #0 {
  %1 = alloca %struct.t1*, align 8
  store %struct.t1* %ps, %struct.t1** %1, align 8
  %2 = load %struct.t1** %1, align 8
  %3 = getelementptr inbounds %struct.t1* %2, i32 0, i32 0
  store i32 10000, i32* %3, align 4
  %4 = load %struct.t1** %1, align 8
  %5 = getelementptr inbounds %struct.t1* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = udiv i32 %6, 3
  %8 = load %struct.t1** %1, align 8
  %9 = getelementptr inbounds %struct.t1* %8, i32 0, i32 1
  store i32 %7, i32* %9, align 4
  %10 = load %struct.t1** %1, align 8
  %11 = getelementptr inbounds %struct.t1* %10, i32 0, i32 2
  store i32 10000, i32* %11, align 4
  %12 = load %struct.t1** %1, align 8
  %13 = getelementptr inbounds %struct.t1* %12, i32 0, i32 2
  %14 = load i32* %13, align 4
  %15 = udiv i32 %14, 3
  %16 = load %struct.t1** %1, align 8
  %17 = getelementptr inbounds %struct.t1* %16, i32 0, i32 3
  store i32 %15, i32* %17, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.t1, align 4
  store i32 0, i32* %1
  call void @f(%struct.t1* %s)
  %2 = getelementptr inbounds %struct.t1* %s, i32 0, i32 0
  %3 = load i32* %2, align 4
  %4 = icmp ne i32 %3, 10000
  br i1 %4, label %17, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.t1* %s, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = icmp ne i32 %7, 3333
  br i1 %8, label %17, label %9

; <label>:9                                       ; preds = %5
  %10 = getelementptr inbounds %struct.t1* %s, i32 0, i32 2
  %11 = load i32* %10, align 4
  %12 = icmp ne i32 %11, 10000
  br i1 %12, label %17, label %13

; <label>:13                                      ; preds = %9
  %14 = getelementptr inbounds %struct.t1* %s, i32 0, i32 3
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 3333
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %13, %9, %5, %0
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %13
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %20 = load i32* %1
  ret i32 %20
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
