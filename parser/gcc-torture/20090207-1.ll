; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20090207-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca [32 x i32], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [32 x i32]* %a, i32 0, i64 1
  store i32 3, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [32 x i32]* %a, i32 0, i64 0
  store i32 1, i32* %arrayidx1, align 4
  %tmp = load i32* %i.addr, align 4
  %idxprom = sext i32 %tmp to i64
  %arrayidx2 = getelementptr inbounds [32 x i32]* %a, i32 0, i64 %idxprom
  store i32 2, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [32 x i32]* %a, i32 0, i64 0
  %tmp4 = load i32* %arrayidx3, align 4
  ret i32 %tmp4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 0)
  %cmp = icmp ne i32 %call, 2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i32 @foo(i32 1)
  %cmp2 = icmp ne i32 %call1, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn
