; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000988.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 89965147, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_6 = alloca i8, align 1
  %l_5 = alloca i32, align 4
  store i8 -1, i8* %l_6, align 1
  store i32 -26, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  store i32 -1913773649, i32* %l_5, align 4
  %6 = load i32* %l_5, align 4
  %7 = trunc i32 %6 to i16
  store i16 %7, i16* %1
  br label %16
                                                  ; No predecessors!
  %9 = load i32* @g_2, align 4
  %10 = trunc i32 %9 to i8
  %11 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %10, i8 signext 6)
  %12 = sext i8 %11 to i32
  store i32 %12, i32* @g_2, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load i8* %l_6, align 1
  %15 = zext i8 %14 to i16
  store i16 %15, i16* %1
  br label %16

; <label>:16                                      ; preds = %13, %5
  %17 = load i16* %1
  ret i16 %17
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
