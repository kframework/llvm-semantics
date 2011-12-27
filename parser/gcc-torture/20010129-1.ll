; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010129-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@baz1.l = internal global i64 0, align 8
@bar = common global i8** null, align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i64 @baz1(i8* %a) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  %tmp = load i64* @baz1.l, align 8
  %inc = add nsw i64 %tmp, 1
  store i64 %inc, i64* @baz1.l, align 8
  ret i64 %tmp
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
  %tmp = load i32* %i.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
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

while.cond:                                       ; preds = %if.end85, %if.then67, %if.then57, %if.then47, %if.then37, %if.then21, %entry
  %tmp = load i8** %a.addr, align 8
  %call = call i64 @baz1(i8* %tmp)
  %tmp2 = load i64* %b.addr, align 8
  %cmp = icmp slt i64 %call, %tmp2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %arrayidx3 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  %tmp4 = load i8* %arrayidx3, align 1
  %conv = sext i8 %tmp4 to i32
  %cmp5 = icmp ne i32 %conv, 32
  br i1 %cmp5, label %land.lhs.true, label %if.end85

land.lhs.true:                                    ; preds = %while.body
  %arrayidx7 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  %tmp8 = load i8* %arrayidx7, align 1
  %conv9 = sext i8 %tmp8 to i32
  %cmp10 = icmp ne i32 %conv9, 9
  br i1 %cmp10, label %if.then, label %if.end85

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %f, align 4
  store i32 0, i32* %e, align 4
  %tmp12 = load i32* %d, align 4
  %tobool = icmp ne i32 %tmp12, 0
  br i1 %tobool, label %if.end22, label %land.lhs.true13

land.lhs.true13:                                  ; preds = %if.then
  %arraydecay = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call14 = call i32 @baz2(i8* %arraydecay)
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %if.then17, label %if.end22

if.then17:                                        ; preds = %land.lhs.true13
  %tmp18 = load i32* %c.addr, align 4
  %and = and i32 %tmp18, 16
  %cmp19 = icmp eq i32 %and, 0
  br i1 %cmp19, label %if.then21, label %if.end

if.then21:                                        ; preds = %if.then17
  br label %while.cond

if.end:                                           ; preds = %if.then17
  store i32 1, i32* %d, align 4
  store i32 1, i32* %e, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.end, %land.lhs.true13, %if.then
  %tmp23 = load i32* %c.addr, align 4
  %and24 = and i32 %tmp23, 16
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %land.lhs.true26, label %land.lhs.true33

land.lhs.true26:                                  ; preds = %if.end22
  %tmp27 = load i32* %c.addr, align 4
  %and28 = and i32 %tmp27, 16384
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %land.lhs.true30, label %land.lhs.true33

land.lhs.true30:                                  ; preds = %land.lhs.true26
  %tmp31 = load i32* %e, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.end38, label %land.lhs.true33

land.lhs.true33:                                  ; preds = %land.lhs.true30, %land.lhs.true26, %if.end22
  %tmp34 = load i32* %c.addr, align 4
  %and35 = and i32 %tmp34, 2
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %land.lhs.true33
  br label %while.cond

if.end38:                                         ; preds = %land.lhs.true33, %land.lhs.true30
  %tmp39 = load i32* %c.addr, align 4
  %and40 = and i32 %tmp39, 8192
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %land.lhs.true42, label %if.end48

land.lhs.true42:                                  ; preds = %if.end38
  %arraydecay43 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call44 = call i32 @baz2(i8* %arraydecay43)
  %cmp45 = icmp eq i32 %call44, 0
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %land.lhs.true42
  br label %while.cond

if.end48:                                         ; preds = %land.lhs.true42, %if.end38
  %tmp49 = load i32* %c.addr, align 4
  %and50 = and i32 %tmp49, 5128
  %tobool51 = icmp ne i32 %and50, 0
  br i1 %tobool51, label %land.lhs.true52, label %if.end58

land.lhs.true52:                                  ; preds = %if.end48
  %arraydecay53 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call54 = call i32 @baz2(i8* %arraydecay53)
  %cmp55 = icmp eq i32 %call54, 0
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true52
  br label %while.cond

if.end58:                                         ; preds = %land.lhs.true52, %if.end48
  %tmp59 = load i32* %c.addr, align 4
  %and60 = and i32 %tmp59, 512
  %tobool61 = icmp ne i32 %and60, 0
  br i1 %tobool61, label %land.lhs.true62, label %if.end68

land.lhs.true62:                                  ; preds = %if.end58
  %arraydecay63 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %call64 = call i32 @baz2(i8* %arraydecay63)
  %cmp65 = icmp eq i32 %call64, 0
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %land.lhs.true62
  br label %while.cond

if.end68:                                         ; preds = %land.lhs.true62, %if.end58
  %tmp69 = load i32* %c.addr, align 4
  %and70 = and i32 %tmp69, 128
  %tobool71 = icmp ne i32 %and70, 0
  br i1 %tobool71, label %if.then72, label %if.end84

if.then72:                                        ; preds = %if.end68
  %tmp73 = load i8*** @bar, align 8
  store i8** %tmp73, i8*** %h, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then72
  %tmp74 = load i8*** %h, align 8
  %tobool75 = icmp ne i8** %tmp74, null
  br i1 %tobool75, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp76 = load i32* %i, align 4
  %call77 = call i32 @baz3(i32 %tmp76)
  %tobool78 = icmp ne i32 %call77, 0
  br i1 %tobool78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %for.body
  br label %for.end

if.end80:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end80
  %tmp81 = load i8*** %h, align 8
  %tmp82 = load i8** %tmp81
  %0 = bitcast i8* %tmp82 to i8**
  store i8** %0, i8*** %h, align 8
  %tmp83 = load i32* %i, align 4
  %inc = add nsw i32 %tmp83, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then79, %for.cond
  br label %if.end84

if.end84:                                         ; preds = %for.end, %if.end68
  store i32 0, i32* %f, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %land.lhs.true, %while.body
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
