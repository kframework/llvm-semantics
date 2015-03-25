; ModuleID = './931102-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.T = type { %struct.anon }
%struct.anon = type { i8, i8 }

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x) #0 {
  %1 = alloca i32, align 4
  %num = alloca i32, align 4
  %reg = alloca %union.T, align 1
  store i32 %x, i32* %1, align 4
  store i32 0, i32* %num, align 4
  %2 = load i32* %1, align 4
  %3 = trunc i32 %2 to i8
  %4 = bitcast %union.T* %reg to %struct.anon*
  %5 = getelementptr inbounds %struct.anon* %4, i32 0, i32 1
  store i8 %3, i8* %5, align 1
  br label %6

; <label>:6                                       ; preds = %13, %0
  %7 = bitcast %union.T* %reg to %struct.anon*
  %8 = getelementptr inbounds %struct.anon* %7, i32 0, i32 1
  %9 = load i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = and i32 %10, 1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %22

; <label>:13                                      ; preds = %6
  %14 = load i32* %num, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %num, align 4
  %16 = bitcast %union.T* %reg to %struct.anon*
  %17 = getelementptr inbounds %struct.anon* %16, i32 0, i32 1
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = ashr i32 %19, 1
  %21 = trunc i32 %20 to i8
  store i8 %21, i8* %17, align 1
  br label %6

; <label>:22                                      ; preds = %6
  %23 = load i32* %num, align 4
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 2)
  %3 = icmp ne i32 %2, 1
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
