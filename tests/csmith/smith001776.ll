; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001776.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 4, align 4
@g_3 = global [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32, align 4
  store i32 -342828527, i32* %l_2, align 4
  store i32* @g_4, i32** %l_5, align 8
  store i32 -1, i32* %l_6, align 4
  %tmp = load i32* %l_2, align 4
  %tmp1 = load i32** %l_5, align 8
  store i32 %tmp, i32* %tmp1
  %tmp2 = load i32* %l_6, align 4
  %conv = trunc i32 %tmp2 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
