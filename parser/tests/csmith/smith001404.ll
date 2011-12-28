; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001404.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32 }

@func_1.l_2 = internal unnamed_addr constant %struct.S0 { i32 -1 }, align 4
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca %struct.S0, align 4
  %l_2 = alloca %struct.S0, align 4
  %tmp = bitcast %struct.S0* %l_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S0* @func_1.l_2 to i8*), i64 4, i32 4, i1 false)
  %tmp1 = bitcast %struct.S0* %retval to i8*
  %tmp2 = bitcast %struct.S0* %l_2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 4, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.S0* %retval, i32 0, i32 0
  %0 = load i32* %coerce.dive
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %coerce = alloca %struct.S0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %coerce.dive = getelementptr %struct.S0* %coerce, i32 0, i32 0
  store i32 %call, i32* %coerce.dive
  %0 = load i32* %retval
  ret i32 %0
}
