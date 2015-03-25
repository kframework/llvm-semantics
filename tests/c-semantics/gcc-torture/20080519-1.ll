; ModuleID = './20080519-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.du_chain = type { %struct.du_chain*, i32 }

@reg_class_contents = common global [2 x [2 x i64]] zeroinitializer, align 16
@main.du1 = private unnamed_addr constant { %struct.du_chain*, i32, [4 x i8] } { %struct.du_chain* null, i32 0, [4 x i8] undef }, align 8

; Function Attrs: noinline nounwind uwtable
define void @merge_overlapping_regs([2 x i64]* %p) #0 {
  %1 = alloca [2 x i64]*, align 8
  store [2 x i64]* %p, [2 x i64]** %1, align 8
  %2 = load [2 x i64]** %1, align 8
  %3 = getelementptr inbounds [2 x i64]* %2, i32 0, i64 0
  %4 = load i64* %3, align 8
  %5 = icmp ne i64 %4, -1
  br i1 %5, label %11, label %6

; <label>:6                                       ; preds = %0
  %7 = load [2 x i64]** %1, align 8
  %8 = getelementptr inbounds [2 x i64]* %7, i32 0, i64 1
  %9 = load i64* %8, align 8
  %10 = icmp ne i64 %9, -1
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %6, %0
  call void @abort() #4
  unreachable

; <label>:12                                      ; preds = %6
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noinline nounwind uwtable
define void @regrename_optimize(%struct.du_chain* %this) #0 {
  %1 = alloca %struct.du_chain*, align 8
  %this_unavailable = alloca [2 x i64], align 16
  %scan_fp_ = alloca i64*, align 8
  %n_uses = alloca i32, align 4
  %last = alloca %struct.du_chain*, align 8
  store %struct.du_chain* %this, %struct.du_chain** %1, align 8
  %2 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  store i64 0, i64* %2, align 8
  %3 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  store i64 0, i64* %3, align 8
  store i32 0, i32* %n_uses, align 4
  %4 = load %struct.du_chain** %1, align 8
  store %struct.du_chain* %4, %struct.du_chain** %last, align 8
  br label %5

; <label>:5                                       ; preds = %33, %0
  %6 = load %struct.du_chain** %last, align 8
  %7 = getelementptr inbounds %struct.du_chain* %6, i32 0, i32 0
  %8 = load %struct.du_chain** %7, align 8
  %9 = icmp ne %struct.du_chain* %8, null
  br i1 %9, label %10, label %37

; <label>:10                                      ; preds = %5
  %11 = load %struct.du_chain** %last, align 8
  %12 = getelementptr inbounds %struct.du_chain* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i32 0, i64 %14
  %16 = getelementptr inbounds [2 x i64]* %15, i32 0, i32 0
  store i64* %16, i64** %scan_fp_, align 8
  %17 = load i32* %n_uses, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %n_uses, align 4
  %19 = load i64** %scan_fp_, align 8
  %20 = getelementptr inbounds i64* %19, i64 0
  %21 = load i64* %20, align 8
  %22 = xor i64 %21, -1
  %23 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  %24 = load i64* %23, align 8
  %25 = or i64 %24, %22
  store i64 %25, i64* %23, align 8
  %26 = load i64** %scan_fp_, align 8
  %27 = getelementptr inbounds i64* %26, i64 1
  %28 = load i64* %27, align 8
  %29 = xor i64 %28, -1
  %30 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  %31 = load i64* %30, align 8
  %32 = or i64 %31, %29
  store i64 %32, i64* %30, align 8
  br label %33

; <label>:33                                      ; preds = %10
  %34 = load %struct.du_chain** %last, align 8
  %35 = getelementptr inbounds %struct.du_chain* %34, i32 0, i32 0
  %36 = load %struct.du_chain** %35, align 8
  store %struct.du_chain* %36, %struct.du_chain** %last, align 8
  br label %5

; <label>:37                                      ; preds = %5
  %38 = load i32* %n_uses, align 4
  %39 = icmp slt i32 %38, 1
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  br label %62

; <label>:41                                      ; preds = %37
  %42 = load %struct.du_chain** %last, align 8
  %43 = getelementptr inbounds %struct.du_chain* %42, i32 0, i32 1
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i32 0, i64 %45
  %47 = getelementptr inbounds [2 x i64]* %46, i32 0, i32 0
  store i64* %47, i64** %scan_fp_, align 8
  %48 = load i64** %scan_fp_, align 8
  %49 = getelementptr inbounds i64* %48, i64 0
  %50 = load i64* %49, align 8
  %51 = xor i64 %50, -1
  %52 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  %53 = load i64* %52, align 8
  %54 = or i64 %53, %51
  store i64 %54, i64* %52, align 8
  %55 = load i64** %scan_fp_, align 8
  %56 = getelementptr inbounds i64* %55, i64 1
  %57 = load i64* %56, align 8
  %58 = xor i64 %57, -1
  %59 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  %60 = load i64* %59, align 8
  %61 = or i64 %60, %58
  store i64 %61, i64* %59, align 8
  call void @merge_overlapping_regs([2 x i64]* %this_unavailable)
  br label %62

; <label>:62                                      ; preds = %41, %40
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %du1 = alloca %struct.du_chain, align 8
  %du0 = alloca %struct.du_chain, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.du_chain* %du1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ({ %struct.du_chain*, i32, [4 x i8] }* @main.du1 to i8*), i64 16, i32 8, i1 false)
  %3 = getelementptr inbounds %struct.du_chain* %du0, i32 0, i32 0
  store %struct.du_chain* %du1, %struct.du_chain** %3, align 8
  %4 = getelementptr inbounds %struct.du_chain* %du0, i32 0, i32 1
  store i32 1, i32* %4, align 4
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 0, i64 0), align 8
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 0, i64 1), align 8
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 1, i64 0), align 8
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 1, i64 1), align 8
  call void @regrename_optimize(%struct.du_chain* %du0)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
