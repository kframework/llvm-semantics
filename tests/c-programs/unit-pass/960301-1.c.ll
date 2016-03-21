; ModuleID = './960301-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo = type { i16, [2 x i8] }

@foo = common global %struct.foo zeroinitializer, align 4
@oldfoo = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @bar(i32 %k) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %k, i32* %2, align 4
  %3 = load i16, i16* getelementptr inbounds (%struct.foo, %struct.foo* @foo, i32 0, i32 0), align 4
  %4 = lshr i16 %3, 12
  %5 = zext i16 %4 to i32
  store i32 %5, i32* @oldfoo, align 4
  %6 = load i32, i32* %2, align 4
  %7 = trunc i32 %6 to i16
  %8 = load i16, i16* getelementptr inbounds (%struct.foo, %struct.foo* @foo, i32 0, i32 0), align 4
  %9 = and i16 %7, 15
  %10 = shl i16 %9, 12
  %11 = and i16 %8, 4095
  %12 = or i16 %11, %10
  store i16 %12, i16* getelementptr inbounds (%struct.foo, %struct.foo* @foo, i32 0, i32 0), align 4
  %13 = zext i16 %9 to i32
  %14 = load i32, i32* %2, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  store i32 1, i32* %1
  br label %18

; <label>:17                                      ; preds = %0
  store i32 2, i32* %1
  br label %18

; <label>:18                                      ; preds = %17, %16
  %19 = load i32, i32* %1
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @bar(i32 1)
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
