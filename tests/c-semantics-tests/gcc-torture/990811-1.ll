; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990811-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i64, i32 }

define i32 @foo(i32 %x, i8* %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  %0 = load i32* %x.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i8** %y.addr, align 8
  %2 = bitcast i8* %1 to %struct.s*
  %a = getelementptr inbounds %struct.s* %2, i32 0, i32 0
  %3 = load i64* %a, align 8
  %conv = trunc i64 %3 to i32
  store i32 %conv, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  %4 = load i8** %y.addr, align 8
  %5 = load i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  store i32 %conv2, i32* %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  %6 = load i8** %y.addr, align 8
  %7 = bitcast i8* %6 to i16*
  %8 = load i16* %7, align 2
  %conv4 = sext i16 %8 to i32
  store i32 %conv4, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %sw.bb3, %sw.bb1, %sw.bb
  %9 = load i32* %retval
  ret i32 %9
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.s, align 8
  %sh = alloca [10 x i16], align 16
  %c = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %a = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  store i64 1, i64* %a, align 8
  %b = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  store i32 2, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = trunc i32 %1 to i16
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10 x i16]* %sh, i32 0, i64 %idxprom
  store i16 %conv, i16* %arrayidx, align 2
  %3 = load i32* %i, align 4
  %conv1 = trunc i32 %3 to i8
  %4 = load i32* %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [10 x i8]* %c, i32 0, i64 %idxprom2
  store i8 %conv1, i8* %arrayidx3, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = bitcast %struct.s* %s to i8*
  %call = call i32 @foo(i32 0, i8* %6)
  %cmp4 = icmp ne i32 %call, 1
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  %arraydecay = getelementptr inbounds [10 x i8]* %c, i32 0, i32 0
  %add.ptr = getelementptr inbounds i8* %arraydecay, i64 3
  %call6 = call i32 @foo(i32 1, i8* %add.ptr)
  %cmp7 = icmp ne i32 %call6, 3
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %arraydecay11 = getelementptr inbounds [10 x i16]* %sh, i32 0, i32 0
  %add.ptr12 = getelementptr inbounds i16* %arraydecay11, i64 3
  %7 = bitcast i16* %add.ptr12 to i8*
  %call13 = call i32 @foo(i32 2, i8* %7)
  %cmp14 = icmp ne i32 %call13, 3
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end10
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @exit(i32) noreturn nounwind
