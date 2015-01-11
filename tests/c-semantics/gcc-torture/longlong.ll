; ModuleID = './longlong.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b = common global [32 x i64] zeroinitializer, align 16
@r = global i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i32 0), align 8
@pars = common global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @alpha_ep_extbl_i_eq_0() #0 {
  %rb = alloca i32, align 4
  %ra = alloca i32, align 4
  %rc = alloca i32, align 4
  %temp = alloca i64, align 8
  %1 = load i64* @pars, align 8
  %2 = lshr i64 %1, 27
  %3 = and i64 %2, 31
  %4 = trunc i64 %3 to i32
  store i32 %4, i32* %rb, align 4
  %5 = load i64* @pars, align 8
  %6 = trunc i64 %5 to i32
  %7 = lshr i32 %6, 5
  %8 = zext i32 %7 to i64
  %9 = and i64 %8, 31
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %ra, align 4
  %11 = load i64* @pars, align 8
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 0
  %14 = zext i32 %13 to i64
  %15 = and i64 %14, 31
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %rc, align 4
  %17 = load i32* %ra, align 4
  %18 = zext i32 %17 to i64
  %19 = load i64** @r, align 8
  %20 = getelementptr inbounds i64* %19, i64 %18
  %21 = load i64* %20, align 8
  %22 = load i32* %rb, align 4
  %23 = zext i32 %22 to i64
  %24 = load i64** @r, align 8
  %25 = getelementptr inbounds i64* %24, i64 %23
  %26 = load i64* %25, align 8
  %27 = and i64 %26, 7
  %28 = shl i64 %27, 3
  %29 = lshr i64 %21, %28
  %30 = and i64 %29, 255
  store i64 %30, i64* %temp, align 8
  %31 = load i32* %rc, align 4
  %32 = icmp ne i32 %31, 31
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %0
  %34 = load i64* %temp, align 8
  %35 = load i32* %rc, align 4
  %36 = zext i32 %35 to i64
  %37 = load i64** @r, align 8
  %38 = getelementptr inbounds i64* %37, i64 %36
  store i64 %34, i64* %38, align 8
  br label %39

; <label>:39                                      ; preds = %33, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i64 3160194, i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 17), align 8
  store i64 6003104017374052362, i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 2), align 8
  store i64 2281701442, i64* @pars, align 8
  call void @alpha_ep_extbl_i_eq_0()
  %2 = load i64* getelementptr inbounds ([32 x i64]* @b, i32 0, i64 2), align 8
  %3 = icmp ne i64 %2, 77
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
