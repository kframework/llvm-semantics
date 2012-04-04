; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010129-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@baz1.l = internal global i64 0, align 8
@bar = common global i8** null, align 8

define i64 @baz1(i8* %a) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  %0 = load i64* @baz1.l, align 8
  %inc = add nsw i64 %0, 1
  store i64 %inc, i64* @baz1.l, align 8
  ret i64 %0
}

define i32 @baz2(i8* %a) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  ret i32 0
}

define i32 @baz3(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 1
}

declare void @abort() noreturn nounwind

define i32 @foo(i8* %a, i64 %b, i32 %c) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i64, align 8
  %c.addr = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %i = alloca i32, align 4
  %g = alloca [256 x i8], align 16
  %h = alloca i8**, align 8
  store i8* %a, i8** %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store i32 0, i32* %d, align 4
  store i32 0, i32* %f, align 4
  %arrayidx = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  store i8 10, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 1
  store i8 0, i8* %arrayidx1, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end66, %if.then55, %if.then46, %if.then37, %if.then28, %if.then16, %entry
  %0 = load i8** %a.addr, align 8
  %call = call i64 @baz1(i8* %0)
  %1 = load i64* %b.addr, align 8
  %cmp = icmp slt i64 %call, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %arrayidx2 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  %2 = load i8* %arrayidx2, align 1
  %conv = sext i8 %2 to i32
  %cmp3 = icmp ne i32 %conv, 32
  br i1 %cmp3, label %land.lhs.true, label %if.end66

land.lhs.true:                                    ; preds = %while.body
  %arrayidx5 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  %3 = load i8* %arrayidx5, align 1
  %conv6 = sext i8 %3 to i32
  %cmp7 = icmp ne i32 %conv6, 9
  br i1 %cmp7, label %if.then, label %if.end66

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %f, align 4
  store i32 0, i32* %e, align 4
  %4 = load i32* %d, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end17, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %if.then
  %arraydecay = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call10 = call i32 @baz2(i8* %arraydecay)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then13, label %if.end17

if.then13:                                        ; preds = %land.lhs.true9
  %5 = load i32* %c.addr, align 4
  %and = and i32 %5, 16
  %cmp14 = icmp eq i32 %and, 0
  br i1 %cmp14, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.then13
  br label %while.cond

if.end:                                           ; preds = %if.then13
  store i32 1, i32* %d, align 4
  store i32 1, i32* %e, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.end, %land.lhs.true9, %if.then
  %6 = load i32* %c.addr, align 4
  %and18 = and i32 %6, 16
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %land.lhs.true20, label %land.lhs.true25

land.lhs.true20:                                  ; preds = %if.end17
  %7 = load i32* %c.addr, align 4
  %and21 = and i32 %7, 16384
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %land.lhs.true23, label %land.lhs.true25

land.lhs.true23:                                  ; preds = %land.lhs.true20
  %8 = load i32* %e, align 4
  %tobool24 = icmp ne i32 %8, 0
  br i1 %tobool24, label %if.end29, label %land.lhs.true25

land.lhs.true25:                                  ; preds = %land.lhs.true23, %land.lhs.true20, %if.end17
  %9 = load i32* %c.addr, align 4
  %and26 = and i32 %9, 2
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %land.lhs.true25
  br label %while.cond

if.end29:                                         ; preds = %land.lhs.true25, %land.lhs.true23
  %10 = load i32* %c.addr, align 4
  %and30 = and i32 %10, 8192
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %land.lhs.true32, label %if.end38

land.lhs.true32:                                  ; preds = %if.end29
  %arraydecay33 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call34 = call i32 @baz2(i8* %arraydecay33)
  %cmp35 = icmp eq i32 %call34, 0
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %land.lhs.true32
  br label %while.cond

if.end38:                                         ; preds = %land.lhs.true32, %if.end29
  %11 = load i32* %c.addr, align 4
  %and39 = and i32 %11, 5128
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %land.lhs.true41, label %if.end47

land.lhs.true41:                                  ; preds = %if.end38
  %arraydecay42 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call43 = call i32 @baz2(i8* %arraydecay42)
  %cmp44 = icmp eq i32 %call43, 0
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %land.lhs.true41
  br label %while.cond

if.end47:                                         ; preds = %land.lhs.true41, %if.end38
  %12 = load i32* %c.addr, align 4
  %and48 = and i32 %12, 512
  %tobool49 = icmp ne i32 %and48, 0
  br i1 %tobool49, label %land.lhs.true50, label %if.end56

land.lhs.true50:                                  ; preds = %if.end47
  %arraydecay51 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call52 = call i32 @baz2(i8* %arraydecay51)
  %cmp53 = icmp eq i32 %call52, 0
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %land.lhs.true50
  br label %while.cond

if.end56:                                         ; preds = %land.lhs.true50, %if.end47
  %13 = load i32* %c.addr, align 4
  %and57 = and i32 %13, 128
  %tobool58 = icmp ne i32 %and57, 0
  br i1 %tobool58, label %if.then59, label %if.end65

if.then59:                                        ; preds = %if.end56
  %14 = load i8*** @bar, align 8
  store i8** %14, i8*** %h, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then59
  %15 = load i8*** %h, align 8
  %tobool60 = icmp ne i8** %15, null
  br i1 %tobool60, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i32* %i, align 4
  %call61 = call i32 @baz3(i32 %16)
  %tobool62 = icmp ne i32 %call61, 0
  br i1 %tobool62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %for.body
  br label %for.end

if.end64:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end64
  %17 = load i8*** %h, align 8
  %18 = load i8** %17, align 8
  %19 = bitcast i8* %18 to i8**
  store i8** %19, i8*** %h, align 8
  %20 = load i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then63, %for.cond
  br label %if.end65

if.end65:                                         ; preds = %for.end, %if.end56
  store i32 0, i32* %f, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %land.lhs.true, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* null, i8** %n, align 8
  store i8** %n, i8*** @bar, align 8
  %0 = bitcast i8** %n to i8*
  %call = call i32 @foo(i8* %0, i64 1, i32 51217)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @exit(i32) noreturn nounwind
