; ModuleID = './20021111-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@aim_callhandler.i = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @aim_callhandler(i32 %sess, i32 %conn, i16 zeroext %family, i16 zeroext %type) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  store i32 %sess, i32* %2, align 4
  store i32 %conn, i32* %3, align 4
  store i16 %family, i16* %4, align 2
  store i16 %type, i16* %5, align 2
  %6 = load i32* %3, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %0
  store i32 0, i32* %1
  br label %25

; <label>:9                                       ; preds = %0
  %10 = load i16* %5, align 2
  %11 = zext i16 %10 to i32
  %12 = icmp eq i32 %11, 65535
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %9
  store i32 0, i32* %1
  br label %25

; <label>:14                                      ; preds = %9
  %15 = load i32* @aim_callhandler.i, align 4
  %16 = icmp sge i32 %15, 1
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %14
  %19 = load i32* @aim_callhandler.i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* @aim_callhandler.i, align 4
  %21 = load i32* %2, align 4
  %22 = load i32* %3, align 4
  %23 = load i16* %4, align 2
  %24 = call i32 @aim_callhandler(i32 %21, i32 %22, i16 zeroext %23, i16 zeroext -1)
  store i32 %24, i32* %1
  br label %25

; <label>:25                                      ; preds = %18, %13, %8
  %26 = load i32* %1
  ret i32 %26
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @aim_callhandler(i32 0, i32 1, i16 zeroext 0, i16 zeroext 0)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %4 = load i32* %1
  ret i32 %4
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
