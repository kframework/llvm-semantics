; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr44164.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { %struct.Y }
%struct.Y = type { %struct.YY }
%struct.YY = type { %struct.Z }
%struct.Z = type { i32 }

@a = common global %struct.X zeroinitializer, align 4

define i32 @foo(%struct.Z* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca %struct.Z*, align 8
  %i = alloca i32, align 4
  %.compoundliteral = alloca %struct.Y, align 4
  store %struct.Z* %p, %struct.Z** %p.addr, align 8
  %tmp = load %struct.Z** %p.addr, align 8
  %i1 = getelementptr inbounds %struct.Z* %tmp, i32 0, i32 0
  %tmp2 = load i32* %i1, align 4
  store i32 %tmp2, i32* %i, align 4
  %bb = getelementptr inbounds %struct.Y* %.compoundliteral, i32 0, i32 0
  %tmp3 = bitcast %struct.YY* %bb to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp3, i8 0, i64 4, i32 4, i1 false)
  %tmp4 = bitcast %struct.Y* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.X* @a to i8*), i8* %tmp4, i64 4, i32 4, i1 false)
  %tmp5 = load %struct.Z** %p.addr, align 8
  %i6 = getelementptr inbounds %struct.Z* %tmp5, i32 0, i32 0
  %tmp7 = load i32* %i6, align 4
  %tmp8 = load i32* %i, align 4
  %add = add nsw i32 %tmp7, %tmp8
  ret i32 %add
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* getelementptr inbounds (%struct.X* @a, i32 0, i32 0, i32 0, i32 0, i32 0), align 4
  %call = call i32 @foo(%struct.Z* getelementptr inbounds (%struct.X* @a, i32 0, i32 0, i32 0, i32 0))
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
