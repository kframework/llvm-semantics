; ModuleID = './20000605-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.F = type { i32 }

; Function Attrs: nounwind uwtable
define void @f1(%struct.F* %x, %struct.F* %y) #0 {
  %1 = alloca %struct.F*, align 8
  %2 = alloca %struct.F*, align 8
  %timeout = alloca i32, align 4
  store %struct.F* %x, %struct.F** %1, align 8
  store %struct.F* %y, %struct.F** %2, align 8
  store i32 0, i32* %timeout, align 4
  br label %3

; <label>:3                                       ; preds = %17, %0
  %4 = load %struct.F*, %struct.F** %1, align 8
  %5 = getelementptr inbounds %struct.F, %struct.F* %4, i32 0, i32 0
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.F*, %struct.F** %2, align 8
  %8 = getelementptr inbounds %struct.F, %struct.F* %7, i32 0, i32 0
  %9 = load i32, i32* %8, align 4
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %3
  %12 = load i32, i32* %timeout, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %timeout, align 4
  %14 = icmp sgt i32 %13, 5
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %11
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load %struct.F*, %struct.F** %1, align 8
  %19 = getelementptr inbounds %struct.F, %struct.F* %18, i32 0, i32 0
  %20 = load i32, i32* %19, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %19, align 4
  br label %3

; <label>:22                                      ; preds = %3
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.F, align 4
  %y = alloca %struct.F, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.F, %struct.F* %x, i32 0, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.F, %struct.F* %y, i32 0, i32 0
  store i32 1, i32* %3, align 4
  call void @f1(%struct.F* %x, %struct.F* %y)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %5 = load i32, i32* %1
  ret i32 %5
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
