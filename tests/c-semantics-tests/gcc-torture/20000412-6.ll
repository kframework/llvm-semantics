; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = global [5 x i16] [i16 1, i16 4, i16 16, i16 64, i16 256], align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @bug(i16 zeroext 512, i16* getelementptr inbounds ([5 x i16]* @buf, i32 0, i32 0), i16* getelementptr inbounds ([5 x i16]* @buf, i32 0, i64 3))
  %cmp = icmp ne i32 %call, 491
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @bug(i16 zeroext %value, i16* %buffer, i16* %bufend) nounwind uwtable {
entry:
  %value.addr = alloca i16, align 2
  %buffer.addr = alloca i16*, align 8
  %bufend.addr = alloca i16*, align 8
  %tmp = alloca i16*, align 8
  store i16 %value, i16* %value.addr, align 2
  store i16* %buffer, i16** %buffer.addr, align 8
  store i16* %bufend, i16** %bufend.addr, align 8
  %0 = load i16** %buffer.addr, align 8
  store i16* %0, i16** %tmp, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16** %tmp, align 8
  %2 = load i16** %bufend.addr, align 8
  %cmp = icmp ult i16* %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i16** %tmp, align 8
  %4 = load i16* %3, align 2
  %conv = zext i16 %4 to i32
  %5 = load i16* %value.addr, align 2
  %conv1 = zext i16 %5 to i32
  %sub = sub nsw i32 %conv1, %conv
  %conv2 = trunc i32 %sub to i16
  store i16 %conv2, i16* %value.addr, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i16** %tmp, align 8
  %incdec.ptr = getelementptr inbounds i16* %6, i32 1
  store i16* %incdec.ptr, i16** %tmp, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i16* %value.addr, align 2
  %conv3 = zext i16 %7 to i32
  ret i32 %conv3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
