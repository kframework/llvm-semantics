; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000000.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1649564615, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_2 = alloca [2 x i16], align 2
  %i = alloca i32, align 4
  %l_4 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i16]* %l_2, i32 0, i64 %7
  store i16 0, i16* %8, align 2
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store volatile i32 0, i32* @g_3, align 4
  br label %13

; <label>:13                                      ; preds = %18, %12
  %14 = load volatile i32* @g_3, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %13
  store i32 6, i32* %l_4, align 4
  %17 = load i32* %l_4, align 4
  store i32 %17, i32* %1
  br label %23
                                                  ; No predecessors!
  %19 = load volatile i32* @g_3, align 4
  %20 = add nsw i32 %19, 2
  store volatile i32 %20, i32* @g_3, align 4
  br label %13

; <label>:21                                      ; preds = %13
  %22 = load volatile i32* @g_3, align 4
  store i32 %22, i32* %1
  br label %23

; <label>:23                                      ; preds = %21, %16
  %24 = load i32* %1
  ret i32 %24
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
