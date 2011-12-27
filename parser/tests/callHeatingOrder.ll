; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/callHeatingOrder.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [2 x i8] }

@main.x11 = internal unnamed_addr constant %struct.anon { [2 x i8] c"h\00" }, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x11 = alloca %struct.anon, align 1
  store i32 0, i32* %retval
  %tmp = bitcast %struct.anon* %x11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds (%struct.anon* @main.x11, i32 0, i32 0, i32 0), i64 2, i32 1, i1 false)
  %a = getelementptr inbounds %struct.anon* %x11, i32 0, i32 0
  %arraydecay = getelementptr inbounds [2 x i8]* %a, i32 0, i32 0
  %tmp1 = load i8* %arraydecay
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
