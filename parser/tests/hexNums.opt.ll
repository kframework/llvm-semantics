; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/hexNums.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [14 x i8] c"b not INT_MIN\00"

define void @foo(i32 %a) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
