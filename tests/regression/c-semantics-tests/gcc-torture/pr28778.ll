; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28778.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @find(i32* %alistp) nounwind uwtable {
entry:
  %alistp.addr = alloca i32*, align 8
  %blist = alloca i32*, align 8
  %list = alloca [32 x i32], align 16
  store i32* %alistp, i32** %alistp.addr, align 8
  %0 = load i32** %alistp.addr, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32** %alistp.addr, align 8
  store i32* %1, i32** %blist, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [32 x i32]* %list, i32 0, i64 3
  store i32 42, i32* %arrayidx, align 4
  %arraydecay = getelementptr inbounds [32 x i32]* %list, i32 0, i32 0
  store i32* %arraydecay, i32** %blist, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32** %blist, align 8
  %3 = bitcast i32* %2 to i64*
  call void @aglChoosePixelFormat(i64* %3)
  ret void
}

define void @aglChoosePixelFormat(i64* %a) nounwind uwtable {
entry:
  %a.addr = alloca i64*, align 8
  %b = alloca i32*, align 8
  store i64* %a, i64** %a.addr, align 8
  %0 = load i64** %a.addr, align 8
  %1 = bitcast i64* %0 to i32*
  store i32* %1, i32** %b, align 8
  %2 = load i32** %b, align 8
  %arrayidx = getelementptr inbounds i32* %2, i64 3
  %3 = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %3, 42
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @find(i32* null)
  ret i32 0
}
