; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/challenge04.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { [2 x i32] }

@s = common global %struct.t zeroinitializer, align 8

define void @f(i64 %s.coerce) nounwind uwtable readnone {
entry:
  ret void
}

define void @g(i32* nocapture %a) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %a, i64 1
  store i32 5, i32* %arrayidx, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %tmp = load i32* getelementptr inbounds (%struct.t* @s, i64 0, i32 0, i64 1), align 4
  store i32 5, i32* getelementptr inbounds (%struct.t* @s, i64 0, i32 0, i64 1), align 4
  %add = add nsw i32 %tmp, 5
  ret i32 %add
}
