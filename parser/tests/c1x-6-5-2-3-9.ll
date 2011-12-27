; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-5-2-3-9.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, double }
%struct.anon = type { i32 }
%union.anon = type { %0 }

@u = common global %union.anon zeroinitializer, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* getelementptr inbounds (%union.anon* @u, i32 0, i32 0, i32 0), align 4
  store double 3.140000e+00, double* getelementptr inbounds (%union.anon* @u, i32 0, i32 0, i32 1), align 8
  %tmp = load i32* getelementptr inbounds (%struct.anon* bitcast (%union.anon* @u to %struct.anon*), i32 0, i32 0), align 4
  %cmp = icmp eq i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %tmp1 = load double* getelementptr inbounds (%union.anon* @u, i32 0, i32 0, i32 1), align 8
  %cmp2 = fcmp ogt double %tmp1, 3.000000e+00
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end4, %if.then3
  %0 = load i32* %retval
  ret i32 %0
}
