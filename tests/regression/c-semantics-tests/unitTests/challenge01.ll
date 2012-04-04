; ModuleID = '/home/david/src/c-semantics/tests/unitTests/challenge01.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { i32 }

@s = common global %struct.t zeroinitializer, align 4

define i32 @f(i32 %s.coerce) nounwind uwtable {
entry:
  %retval = alloca %struct.t, align 4
  %s = alloca %struct.t, align 4
  %coerce.dive = getelementptr %struct.t* %s, i32 0, i32 0
  store i32 %s.coerce, i32* %coerce.dive
  %x = getelementptr inbounds %struct.t* %s, i32 0, i32 0
  store i32 5, i32* %x, align 4
  %0 = bitcast %struct.t* %retval to i8*
  %1 = bitcast %struct.t* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 4, i32 4, i1 false)
  %coerce.dive1 = getelementptr %struct.t* %retval, i32 0, i32 0
  %2 = load i32* %coerce.dive1
  ret i32 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %coerce = alloca %struct.t, align 4
  store i32 0, i32* %retval
  %0 = load i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0)
  %call = call i32 @f(i32 %0)
  %coerce.dive = getelementptr %struct.t* %coerce, i32 0, i32 0
  store i32 %call, i32* %coerce.dive
  %x = getelementptr inbounds %struct.t* %coerce, i32 0, i32 0
  %1 = load i32* %x, align 4
  %2 = load i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0), align 4
  %add = add nsw i32 %1, %2
  ret i32 %add
}
