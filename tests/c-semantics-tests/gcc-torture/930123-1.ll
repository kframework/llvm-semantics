; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930123-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [2 x i8] c"c\00", align 1

define void @f(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  %0 = load i32** %x.addr, align 8
  store i32 0, i32* %0, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca i32, align 4
  %c = alloca i32, align 4
  %x = alloca i32, align 4
  %a = alloca [2 x i8], align 1
  store i32 0, i32* %retval
  %0 = bitcast [2 x i8]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([2 x i8]* @main.a, i32 0, i32 0), i64 2, i32 1, i1 false)
  call void @f(i32* %s)
  %1 = load i32* %s, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  store i32 1, i32* %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  store i32 2, i32* %x, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 97, %cond.true ], [ 98, %cond.false ]
  %conv = trunc i32 %cond to i8
  store i32 0, i32* %c, align 4
  %arrayidx = getelementptr inbounds [2 x i8]* %a, i32 0, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %2 = load i32* %c, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx1 = getelementptr inbounds [2 x i8]* %a, i32 0, i64 %idxprom
  %3 = load i8* %arrayidx1, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp ne i32 %conv2, 97
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
