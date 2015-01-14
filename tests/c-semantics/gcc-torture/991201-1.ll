; ModuleID = './991201-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vc_data = type { i64, [48 x i8] }
%struct.vc = type { %struct.vc_data* }

@a_con = common global %struct.vc_data zeroinitializer, align 8
@vc_cons = global [63 x %struct.vc] [%struct.vc { %struct.vc_data* @a_con }, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer], align 16
@default_red = common global [16 x i32] zeroinitializer, align 16
@default_grn = common global [16 x i32] zeroinitializer, align 16
@default_blu = common global [16 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @reset_palette(i32 %currcons) #0 {
  %1 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %currcons, i32* %1, align 4
  store i32 0, i32* %k, align 4
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %51, %0
  %3 = load i32* %j, align 4
  %4 = icmp slt i32 %3, 16
  br i1 %4, label %5, label %54

; <label>:5                                       ; preds = %2
  %6 = load i32* %j, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [16 x i32]* @default_red, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = trunc i32 %9 to i8
  %11 = load i32* %k, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %k, align 4
  %13 = sext i32 %11 to i64
  %14 = load i32* %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %15
  %17 = getelementptr inbounds %struct.vc* %16, i32 0, i32 0
  %18 = load %struct.vc_data** %17, align 8
  %19 = getelementptr inbounds %struct.vc_data* %18, i32 0, i32 1
  %20 = getelementptr inbounds [48 x i8]* %19, i32 0, i64 %13
  store i8 %10, i8* %20, align 1
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [16 x i32]* @default_grn, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = trunc i32 %24 to i8
  %26 = load i32* %k, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %k, align 4
  %28 = sext i32 %26 to i64
  %29 = load i32* %1, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %30
  %32 = getelementptr inbounds %struct.vc* %31, i32 0, i32 0
  %33 = load %struct.vc_data** %32, align 8
  %34 = getelementptr inbounds %struct.vc_data* %33, i32 0, i32 1
  %35 = getelementptr inbounds [48 x i8]* %34, i32 0, i64 %28
  store i8 %25, i8* %35, align 1
  %36 = load i32* %j, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [16 x i32]* @default_blu, i32 0, i64 %37
  %39 = load i32* %38, align 4
  %40 = trunc i32 %39 to i8
  %41 = load i32* %k, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %k, align 4
  %43 = sext i32 %41 to i64
  %44 = load i32* %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %45
  %47 = getelementptr inbounds %struct.vc* %46, i32 0, i32 0
  %48 = load %struct.vc_data** %47, align 8
  %49 = getelementptr inbounds %struct.vc_data* %48, i32 0, i32 1
  %50 = getelementptr inbounds [48 x i8]* %49, i32 0, i64 %43
  store i8 %40, i8* %50, align 1
  br label %51

; <label>:51                                      ; preds = %5
  %52 = load i32* %j, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %j, align 4
  br label %2

; <label>:54                                      ; preds = %2
  %55 = load i32* %k, align 4
  call void @bar(i32 %55)
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(i32 %k) #0 {
  %1 = alloca i32, align 4
  store i32 %k, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 48
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @reset_palette(i32 0)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
