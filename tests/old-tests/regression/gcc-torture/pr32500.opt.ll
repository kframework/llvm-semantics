; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr32500.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@main.numbers = internal unnamed_addr constant [4 x i32] [i32 57005, i32 48879, i32 4919, i32 16962], align 16

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  store i32 %i, i32* @x, align 4
  ret void
}

define void @bar() noreturn nounwind uwtable noinline {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.else, %if.then, %entry
  %indvar = phi i64 [ 0, %entry ], [ %tmp2, %if.then ], [ %tmp2, %if.else ]
  %tmp = add i64 %indvar, 4294967290
  %storemerge.off = trunc i64 %tmp to i32
  %arrayidx = getelementptr [4 x i32]* @main.numbers, i64 0, i64 %indvar
  %tmp2 = add i64 %indvar, 1
  %storemerge = trunc i64 %tmp2 to i32
  %cmp = icmp slt i32 %storemerge, 13
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %cmp3 = icmp slt i32 %storemerge, 5
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %tmp5 = load i32* %arrayidx, align 4
  tail call void @foo(i32 %tmp5)
  br label %for.cond

if.else:                                          ; preds = %for.body
  %0 = icmp ult i32 %storemerge.off, 3
  br i1 %0, label %if.then10, label %for.cond

if.then10:                                        ; preds = %if.else
  tail call void @bar()
  unreachable

for.end:                                          ; preds = %for.cond
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn
