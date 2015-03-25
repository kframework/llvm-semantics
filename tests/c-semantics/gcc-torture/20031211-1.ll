; ModuleID = './20031211-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.a = type { i8, [3 x i8] }

@main.a = private unnamed_addr constant %struct.a { i8 0, [3 x i8] undef }, align 4
@x = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.a, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.a* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds (%struct.a* @main.a, i32 0, i32 0), i64 4, i32 4, i1 false)
  store i32 48879, i32* @x, align 4
  %3 = load i32* @x, align 4
  %4 = bitcast %struct.a* %a to i8*
  %5 = load i8* %4, align 4
  %6 = and i8 %5, 1
  %7 = zext i8 %6 to i32
  %8 = or i32 %7, %3
  %9 = trunc i32 %8 to i8
  %10 = load i8* %4, align 4
  %11 = and i8 %9, 1
  %12 = and i8 %10, -2
  %13 = or i8 %12, %11
  store i8 %13, i8* %4, align 4
  %14 = zext i8 %11 to i32
  %15 = bitcast %struct.a* %a to i8*
  %16 = load i8* %15, align 4
  %17 = and i8 %16, 1
  %18 = zext i8 %17 to i32
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
