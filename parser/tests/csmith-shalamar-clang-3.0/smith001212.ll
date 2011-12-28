; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001212.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_2 = alloca i8, align 1
  %l_3 = alloca i8, align 1
  store i8 4, i8* %l_2, align 1
  %2 = load i8* %l_2, align 1
  %3 = icmp ne i8 %2, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  store i8 11, i8* %l_3, align 1
  %5 = load i8* %l_3, align 1
  %6 = zext i8 %5 to i64
  store i64 %6, i64* %1
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i8* %l_2, align 1
  %9 = sext i8 %8 to i64
  store i64 %9, i64* %1
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = load i64* %1
  ret i64 %11
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* %1
  ret i32 %5
}
