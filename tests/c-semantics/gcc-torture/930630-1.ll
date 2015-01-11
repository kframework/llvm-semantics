; ModuleID = './930630-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [4 x i8] }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %bf = alloca %struct.anon, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.anon* %bf to i32*
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -16646145
  %5 = or i32 %4, 917504
  store i32 %5, i32* %2, align 4
  %6 = bitcast %struct.anon* %bf to i32*
  %7 = load i32* %6, align 4
  %8 = shl i32 %7, 8
  %9 = ashr i32 %8, 25
  call void @f(i32 %9)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define void @f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 7
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
