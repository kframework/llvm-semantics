; ModuleID = '/home/david/src/c-semantics/tests/cil/test37.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a = type { i32, i32 }

@z = common global %struct.a zeroinitializer, align 4
@.str = private unnamed_addr constant [19 x i8] c"hello world %d %d\0A\00", align 1

define i64 @g(i64 %b.coerce) nounwind uwtable {
entry:
  %retval = alloca %struct.a, align 4
  %b = alloca %struct.a, align 8
  %0 = bitcast %struct.a* %b to i64*
  store i64 %b.coerce, i64* %0, align 1
  %x = getelementptr inbounds %struct.a* %b, i32 0, i32 0
  %1 = load i32* %x, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %x, align 4
  %2 = bitcast %struct.a* %retval to i8*
  %3 = bitcast %struct.a* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 4, i1 false)
  %4 = bitcast %struct.a* %retval to i64*
  %5 = load i64* %4, align 1
  ret i64 %5
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @f() nounwind uwtable {
entry:
  %tt = alloca %struct.a, align 4
  %coerce = alloca %struct.a, align 4
  %0 = bitcast %struct.a* %tt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.a* @z to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast %struct.a* %tt to i64*
  %2 = load i64* %1, align 1
  %call = call i64 @g(i64 %2)
  %3 = bitcast %struct.a* %coerce to i64*
  store i64 %call, i64* %3, align 1
  %4 = bitcast %struct.a* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.a* @z to i8*), i8* %4, i64 8, i32 4, i1 false)
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 22, i32* getelementptr inbounds (%struct.a* @z, i32 0, i32 0), align 4
  call void @f()
  %0 = load i32* getelementptr inbounds (%struct.a* @z, i32 0, i32 0), align 4
  %1 = load i32* getelementptr inbounds (%struct.a* @z, i32 0, i32 1), align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %1)
  ret i32 0
}

declare i32 @printf(i8*, ...)
