; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr41395-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.VEC_char_base = type { i32, i32, [1 x i16] }

define signext i16 @foo(%struct.VEC_char_base* %p, i32 %i) nounwind uwtable noinline {
entry:
  %idxprom = sext i32 %i to i64
  %arrayidx = getelementptr inbounds %struct.VEC_char_base* %p, i64 0, i32 2, i64 %idxprom
  store i16 0, i16* %arrayidx, align 2
  %arrayidx4 = getelementptr inbounds %struct.VEC_char_base* %p, i64 0, i32 2, i64 8
  store i16 1, i16* %arrayidx4, align 2
  %tmp11 = load i16* %arrayidx, align 2
  ret i16 %tmp11
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i8* @malloc(i32 268)
  %0 = bitcast i8* %call to %struct.VEC_char_base*
  %call1 = tail call signext i16 @foo(%struct.VEC_char_base* %0, i32 8)
  %cmp = icmp eq i16 %call1, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare noalias i8* @malloc(i32) nounwind

declare void @abort() noreturn
