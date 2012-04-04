; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bar.i = internal global i32 0, align 4
@g = common global [48 x [3 x [3 x i32]]] zeroinitializer, align 16

define void @bar([3 x i32]* %x, [3 x i32]* %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca [3 x i32]*, align 8
  %y.addr = alloca [3 x i32]*, align 8
  store [3 x i32]* %x, [3 x i32]** %x.addr, align 8
  store [3 x i32]* %y, [3 x i32]** %y.addr, align 8
  %0 = load [3 x i32]** %x.addr, align 8
  %1 = load i32* @bar.i, align 4
  %add = add nsw i32 %1, 8
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [3 x [3 x i32]]* %arrayidx, i32 0, i32 0
  %cmp = icmp ne [3 x i32]* %0, %arraydecay
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load [3 x i32]** %y.addr, align 8
  %3 = load i32* @bar.i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @bar.i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i32 0, i64 %idxprom1
  %arraydecay3 = getelementptr inbounds [3 x [3 x i32]]* %arrayidx2, i32 0, i32 0
  %cmp4 = icmp ne [3 x i32]* %2, %arraydecay3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %x.addr.i = alloca [3 x [3 x i32]]*, align 8
  %i.i = alloca i32, align 4
  %k.i = alloca i32, align 4
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store [3 x [3 x i32]]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i32 0, i32 0), [3 x [3 x i32]]** %x.addr.i, align 8
  store i32 0, i32* %i.i, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %0 = load i32* %i.i, align 4
  %cmp.i = icmp slt i32 %0, 8
  br i1 %cmp.i, label %for.body.i, label %foo.exit

for.body.i:                                       ; preds = %for.cond.i
  %1 = load i32* %i.i, align 4
  %add.i = add nsw i32 %1, 8
  store i32 %add.i, i32* %k.i, align 4
  %2 = load i32* %k.i, align 4
  %idxprom.i = sext i32 %2 to i64
  %3 = load [3 x [3 x i32]]** %x.addr.i, align 8
  %arrayidx.i = getelementptr inbounds [3 x [3 x i32]]* %3, i64 %idxprom.i
  %arraydecay.i = getelementptr inbounds [3 x [3 x i32]]* %arrayidx.i, i32 0, i32 0
  %4 = load i32* %k.i, align 4
  %sub.i = sub nsw i32 %4, 8
  %idxprom1.i = sext i32 %sub.i to i64
  %5 = load [3 x [3 x i32]]** %x.addr.i, align 8
  %arrayidx2.i = getelementptr inbounds [3 x [3 x i32]]* %5, i64 %idxprom1.i
  %arraydecay3.i = getelementptr inbounds [3 x [3 x i32]]* %arrayidx2.i, i32 0, i32 0
  call void @bar([3 x i32]* %arraydecay.i, [3 x i32]* %arraydecay3.i) nounwind
  %6 = load i32* %i.i, align 4
  %inc.i = add nsw i32 %6, 1
  store i32 %inc.i, i32* %i.i, align 4
  br label %for.cond.i

foo.exit:                                         ; preds = %for.cond.i
  ret i32 0
}
