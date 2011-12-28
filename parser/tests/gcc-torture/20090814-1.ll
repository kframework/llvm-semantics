; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20090814-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@a = common global [2 x i32] zeroinitializer, align 4

define i32 @bar(i32* %a) nounwind uwtable noinline {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  %tmp = load i32** %a.addr, align 8
  %tmp1 = load i32* %tmp
  ret i32 %tmp1
}

define i32 @foo([2 x i32]* %a) nounwind uwtable noinline {
entry:
  %a.addr = alloca [2 x i32]*, align 8
  store [2 x i32]* %a, [2 x i32]** %a.addr, align 8
  %tmp = load i32* @i, align 4
  %idxprom = sext i32 %tmp to i64
  %tmp1 = load [2 x i32]** %a.addr, align 8
  %arrayidx = getelementptr inbounds [2 x i32]* %tmp1, i32 0, i64 %idxprom
  %call = call i32 @bar(i32* %arrayidx)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  store i32 42, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  store i32 1, i32* @i, align 4
  %call = call i32 @foo([2 x i32]* @a)
  %cmp = icmp ne i32 %call, 42
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
