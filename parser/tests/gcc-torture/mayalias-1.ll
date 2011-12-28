; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/mayalias-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i16*, align 8
  store i32 0, i32* %retval
  store i32 305419896, i32* %a, align 4
  %0 = bitcast i32* %a to i16*
  store i16* %0, i16** %b, align 8
  %tmp = load i16** %b, align 8
  %arrayidx = getelementptr inbounds i16* %tmp, i64 1
  store i16 0, i16* %arrayidx
  %tmp1 = load i32* %a, align 4
  %cmp = icmp eq i32 %tmp1, 305419896
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
