; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001319.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { %struct.S0, i8, i8 }
%struct.S0 = type { i16 }
%struct.S1 = type { %struct.S0, i8 }

@func_1.l_2 = internal unnamed_addr constant %0 { %struct.S0 { i16 7 }, i8 -10, i8 undef }, align 2
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca %struct.S1, align 2
  %l_2 = alloca %struct.S1, align 2
  %tmp = bitcast %struct.S1* %l_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%0* @func_1.l_2 to i8*), i64 4, i32 2, i1 false)
  %tmp1 = bitcast %struct.S1* %retval to i8*
  %tmp2 = bitcast %struct.S1* %l_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 4, i32 2, i1 false)
  %0 = bitcast %struct.S1* %retval to i32*
  %1 = load i32* %0, align 1
  ret i32 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %coerce = alloca %struct.S1, align 2
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %0 = bitcast %struct.S1* %coerce to i32*
  store i32 %call, i32* %0
  %1 = load i32* %retval
  ret i32 %1
}
