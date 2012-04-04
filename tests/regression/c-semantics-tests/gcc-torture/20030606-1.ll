; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030606-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32* @foo(i32* %x, i32 %b) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  %b.addr = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %x.addr, align 8
  store i32 55, i32* %0, align 4
  %1 = load i32* %b.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32* %b.addr, align 4
  %3 = load i32** %x.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32* %3, i32 1
  store i32* %incdec.ptr1, i32** %x.addr, align 8
  store i32 %2, i32* %3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32** %x.addr, align 8
  ret i32* %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %0 = bitcast i32* %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 1, i64 20, i32 4, i1 false)
  %arraydecay1 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call = call i32* @foo(i32* %arraydecay1, i32 0)
  %arraydecay2 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %sub.ptr.lhs.cast = ptrtoint i32* %call to i64
  %sub.ptr.rhs.cast = ptrtoint i32* %arraydecay2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 4
  %cmp = icmp ne i64 %sub.ptr.div, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %1 = load i32* %arrayidx, align 4
  %cmp3 = icmp ne i32 %1, 55
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arrayidx5 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 1
  %2 = load i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 4
  %3 = load i32* %arrayidx6, align 4
  %cmp7 = icmp ne i32 %2, %3
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  %arraydecay8 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %4 = bitcast i32* %arraydecay8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 1, i64 20, i32 4, i1 false)
  %arraydecay9 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call10 = call i32* @foo(i32* %arraydecay9, i32 2)
  %arraydecay11 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %sub.ptr.lhs.cast12 = ptrtoint i32* %call10 to i64
  %sub.ptr.rhs.cast13 = ptrtoint i32* %arraydecay11 to i64
  %sub.ptr.sub14 = sub i64 %sub.ptr.lhs.cast12, %sub.ptr.rhs.cast13
  %sub.ptr.div15 = sdiv exact i64 %sub.ptr.sub14, 4
  %cmp16 = icmp ne i64 %sub.ptr.div15, 2
  br i1 %cmp16, label %if.then23, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.end
  %arrayidx18 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %5 = load i32* %arrayidx18, align 4
  %cmp19 = icmp ne i32 %5, 55
  br i1 %cmp19, label %if.then23, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false17
  %arrayidx21 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 1
  %6 = load i32* %arrayidx21, align 4
  %cmp22 = icmp ne i32 %6, 2
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %lor.lhs.false20, %lor.lhs.false17, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %lor.lhs.false20
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %7 = load i32* %retval
  ret i32 %7
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
