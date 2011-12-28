; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/initUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%union.U = type { i32 }
%union.U2 = type { float }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %union.U, align 4
  %t2 = alloca %union.U2, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %union.U* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 4, i32 4, i1 false)
  %tmp2 = bitcast %union.U2* %t2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 4, i32 4, i1 false)
  %i = bitcast %union.U* %t to i32*
  %tmp3 = load i32* %i, align 4
  %cmp = icmp ne i32 %tmp3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %f = bitcast %union.U2* %t2 to float*
  %tmp4 = load float* %f, align 4
  %conv = fpext float %tmp4 to double
  %cmp5 = fcmp une double %conv, 0.000000e+00
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end8:                                          ; preds = %if.end
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn
