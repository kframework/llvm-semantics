; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.y = private unnamed_addr constant [2 x i64] [i64 -1, i64 16000], align 16
@main.yw = private unnamed_addr constant [2 x i16] [i16 -1, i16 16000], align 2

define i64 @xb(i64* %y) nounwind uwtable noinline {
entry:
  %y.addr = alloca i64*, align 8
  %xx = alloca i64, align 8
  store i64* %y, i64** %y.addr, align 8
  %0 = load i64** %y.addr, align 8
  %1 = load i64* %0, align 8
  %and = and i64 %1, 255
  store i64 %and, i64* %xx, align 8
  %2 = load i64* %xx, align 8
  %3 = load i64** %y.addr, align 8
  %arrayidx = getelementptr inbounds i64* %3, i64 1
  %4 = load i64* %arrayidx, align 8
  %add = add nsw i64 %2, %4
  ret i64 %add
}

define i64 @xw(i64* %y) nounwind uwtable noinline {
entry:
  %y.addr = alloca i64*, align 8
  %xx = alloca i64, align 8
  store i64* %y, i64** %y.addr, align 8
  %0 = load i64** %y.addr, align 8
  %1 = load i64* %0, align 8
  %and = and i64 %1, 65535
  store i64 %and, i64* %xx, align 8
  %2 = load i64* %xx, align 8
  %3 = load i64** %y.addr, align 8
  %arrayidx = getelementptr inbounds i64* %3, i64 1
  %4 = load i64* %arrayidx, align 8
  %add = add nsw i64 %2, %4
  ret i64 %add
}

define signext i16 @yb(i16* %y) nounwind uwtable noinline {
entry:
  %y.addr = alloca i16*, align 8
  %xx = alloca i16, align 2
  store i16* %y, i16** %y.addr, align 8
  %0 = load i16** %y.addr, align 8
  %1 = load i16* %0, align 2
  %conv = sext i16 %1 to i32
  %and = and i32 %conv, 255
  %conv1 = trunc i32 %and to i16
  store i16 %conv1, i16* %xx, align 2
  %2 = load i16* %xx, align 2
  %conv2 = sext i16 %2 to i32
  %3 = load i16** %y.addr, align 8
  %arrayidx = getelementptr inbounds i16* %3, i64 1
  %4 = load i16* %arrayidx, align 2
  %conv3 = sext i16 %4 to i32
  %add = add nsw i32 %conv2, %conv3
  %conv4 = trunc i32 %add to i16
  ret i16 %conv4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y = alloca [2 x i64], align 16
  %yw = alloca [2 x i16], align 2
  store i32 0, i32* %retval
  %0 = bitcast [2 x i64]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x i64]* @main.y to i8*), i64 16, i32 16, i1 false)
  %1 = bitcast [2 x i16]* %yw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([2 x i16]* @main.yw to i8*), i64 4, i32 2, i1 false)
  %arraydecay = getelementptr inbounds [2 x i64]* %y, i32 0, i32 0
  %call = call i64 @xb(i64* %arraydecay)
  %cmp = icmp ne i64 %call, 16255
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arraydecay1 = getelementptr inbounds [2 x i64]* %y, i32 0, i32 0
  %call2 = call i64 @xw(i64* %arraydecay1)
  %cmp3 = icmp ne i64 %call2, 81535
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arraydecay5 = getelementptr inbounds [2 x i16]* %yw, i32 0, i32 0
  %call6 = call signext i16 @yb(i16* %arraydecay5)
  %conv = sext i16 %call6 to i32
  %cmp7 = icmp ne i32 %conv, 16255
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
