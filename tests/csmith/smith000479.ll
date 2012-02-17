; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000479.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 2, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i16, align 2
  %l_3 = alloca i32, align 4
  store i16 -1, i16* %l_2, align 2
  store i32 -1554040502, i32* %l_3, align 4
  store i16 30172, i16* %l_2, align 2
  %tmp = load i16* %l_2, align 2
  %conv = zext i16 %tmp to i32
  store i32 %conv, i32* %l_3, align 4
  %tmp1 = load i8* @g_4, align 1
  %conv2 = sext i8 %tmp1 to i32
  ret i32 %conv2
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i8* @g_4, align 1
  %conv = sext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
