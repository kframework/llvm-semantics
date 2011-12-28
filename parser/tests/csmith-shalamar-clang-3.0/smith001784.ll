; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001784.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1615296610, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_5 = alloca i32, align 4
  store volatile i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp slt i32 %3, 27
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load volatile i32* @g_2, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %5
  %9 = load volatile i32* @g_2, align 4
  store i32 %9, i32* %1
  br label %19

; <label>:10                                      ; preds = %5
  store i32 -1, i32* %l_5, align 4
  %11 = load i32* %l_5, align 4
  store i32 %11, i32* %1
  br label %19
                                                  ; No predecessors!
  %13 = load volatile i32* @g_2, align 4
  %14 = trunc i32 %13 to i16
  %15 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %14, i16 signext 1)
  %16 = sext i16 %15 to i32
  store volatile i32 %16, i32* @g_2, align 4
  br label %2

; <label>:17                                      ; preds = %2
  %18 = load volatile i32* @g_2, align 4
  store i32 %18, i32* %1
  br label %19

; <label>:19                                      ; preds = %17, %10, %8
  %20 = load i32* %1
  ret i32 %20
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
