; ModuleID = '/home/david/src/c-semantics/tests/unitTests/challenge02.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [5 x i32] }

@s = common global %struct.anon zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* bitcast (%struct.anon* @s to i8*), i8** %p, align 8
  %0 = load i8** %p, align 8
  %add.ptr = getelementptr inbounds i8* %0, i64 4
  %1 = bitcast i8* %add.ptr to i32*
  store i32 5, i32* %1, align 4
  %2 = load i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0, i64 1), align 4
  ret i32 %2
}
