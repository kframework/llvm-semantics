; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001432.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32* null, align 8
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32*, align 8
  %l_4 = alloca i32, align 4
  volatile store i32* null, i32** %l_3, align 8
  store i32 2054955065, i32* %l_4, align 4
  %tmp = volatile load i32** @g_2, align 8
  volatile store i32* %tmp, i32** %l_3, align 8
  %tmp1 = load i32* %l_4, align 4
  %conv = zext i32 %tmp1 to i64
  ret i64 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %0 = load i32* %retval
  ret i32 %0
}
