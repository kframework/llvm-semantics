; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/c1x0607020119.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.v = type { %union.anon, i32 }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { i64, i64 }
%struct.anon = type { i32, i32 }

@v1 = common global %struct.v zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 2, i32* getelementptr inbounds (%struct.anon* bitcast (%struct.v* @v1 to %struct.anon*), i32 0, i32 0), align 4
  %0 = load i32* getelementptr inbounds (%struct.anon* bitcast (%struct.v* @v1 to %struct.anon*), i32 0, i32 0), align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0)
  store i64 5, i64* getelementptr inbounds (%struct.v* @v1, i32 0, i32 0, i32 0, i32 0), align 8
  %1 = load i64* getelementptr inbounds (%struct.v* @v1, i32 0, i32 0, i32 0, i32 0), align 8
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i64 %1)
  ret i32 0
}

declare i32 @printf(i8*, ...)
