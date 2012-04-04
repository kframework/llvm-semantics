; ModuleID = '/home/david/src/c-semantics/tests/unitTests/structInStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.that = type { %struct.str }
%struct.str = type { [2 x i32 ()*], [2 x [2 x i32 ()*]] }

@globalThat = common global %struct.that zeroinitializer, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.that, align 8
  store i32 0, i32* %retval
  %this = getelementptr inbounds %struct.that* %t, i32 0, i32 0
  %funcArr = getelementptr inbounds %struct.str* %this, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  store i32 ()* @main, i32 ()** %arrayidx, align 8
  %this1 = getelementptr inbounds %struct.that* %t, i32 0, i32 0
  %0 = bitcast %struct.str* %this1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.that* @globalThat to i8*), i8* %0, i64 48, i32 8, i1 false)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
