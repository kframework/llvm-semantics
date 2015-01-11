; ModuleID = './981130-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32, i32 }

@s2 = global %struct.s { i32 1, i32 2 }, align 4
@s1 = common global %struct.s zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @check(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  store i32 9, i32* getelementptr inbounds (%struct.s* @s1, i32 0, i32 0), align 4
  store i32* getelementptr inbounds (%struct.s* @s1, i32 0, i32 0), i32** %p, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.s* @s1 to i8*), i8* bitcast (%struct.s* @s2 to i8*), i64 8, i32 4, i1 false)
  %1 = load i32** %p, align 8
  %2 = load i32* %1, align 4
  store i32 %2, i32* %x, align 4
  %3 = load i32* %x, align 4
  call void @check(i32 %3, i32 1)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
