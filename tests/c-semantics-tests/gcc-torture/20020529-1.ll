; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020529-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.xx = type { i32, %struct.xx*, i16 }

@f1.beenhere = internal global i32 0, align 4

define i32 @foo(%struct.xx* %p, i32 %b, i32 %c, i32 %d) nounwind uwtable {
entry:
  %p.addr = alloca %struct.xx*, align 8
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %a = alloca i32, align 4
  store %struct.xx* %p, %struct.xx** %p.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %sw.epilog, %if.then2, %entry
  %0 = load %struct.xx** %p.addr, align 8
  %call = call i32 @f1(%struct.xx* %0)
  store i32 %call, i32* %a, align 4
  %1 = load i32* %a, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  ret i32 0

if.end:                                           ; preds = %for.cond
  %2 = load i32* %b.addr, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %for.cond

if.end3:                                          ; preds = %if.end
  %3 = load i32* %d.addr, align 4
  %conv = trunc i32 %3 to i16
  %4 = load %struct.xx** %p.addr, align 8
  %c4 = getelementptr inbounds %struct.xx* %4, i32 0, i32 2
  store i16 %conv, i16* %c4, align 2
  %5 = load %struct.xx** %p.addr, align 8
  %a5 = getelementptr inbounds %struct.xx* %5, i32 0, i32 0
  %6 = load i32* %a5, align 4
  %tobool6 = icmp ne i32 %6, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end3
  call void @f2()
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end3
  %7 = load i32* %c.addr, align 4
  %tobool9 = icmp ne i32 %7, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  call void @f2()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end8
  %8 = load %struct.xx** %p.addr, align 8
  %c12 = getelementptr inbounds %struct.xx* %8, i32 0, i32 2
  %9 = load i16* %c12, align 2
  %conv13 = sext i16 %9 to i32
  store i32 %conv13, i32* %d.addr, align 4
  %10 = load i32* %a, align 4
  switch i32 %10, label %sw.default [
    i32 1, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.end11
  %11 = load %struct.xx** %p.addr, align 8
  %b14 = getelementptr inbounds %struct.xx* %11, i32 0, i32 1
  %12 = load %struct.xx** %b14, align 8
  %tobool15 = icmp ne %struct.xx* %12, null
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %sw.bb
  call void @f2()
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %sw.bb
  %13 = load i32* %c.addr, align 4
  %tobool18 = icmp ne i32 %13, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end17
  call void @f2()
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end17
  br label %sw.default

sw.default:                                       ; preds = %if.end11, %if.end20
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %for.cond
}

define i32 @f1(%struct.xx* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.xx*, align 8
  store %struct.xx* %p, %struct.xx** %p.addr, align 8
  %0 = load i32* @f1.beenhere, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f1.beenhere, align 4
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32* @f1.beenhere, align 4
  %cmp1 = icmp sgt i32 %1, 1
  %conv = zext i1 %cmp1 to i32
  ret i32 %conv
}

define void @f2() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.xx, align 8
  store i32 0, i32* %retval
  %a = getelementptr inbounds %struct.xx* %s, i32 0, i32 0
  store i32 0, i32* %a, align 4
  %b = getelementptr inbounds %struct.xx* %s, i32 0, i32 1
  store %struct.xx* %s, %struct.xx** %b, align 8
  %c = getelementptr inbounds %struct.xx* %s, i32 0, i32 2
  store i16 23, i16* %c, align 2
  %call = call i32 @foo(%struct.xx* %s, i32 0, i32 0, i32 0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %a1 = getelementptr inbounds %struct.xx* %s, i32 0, i32 0
  %0 = load i32* %a1, align 4
  %cmp2 = icmp ne i32 %0, 0
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %b4 = getelementptr inbounds %struct.xx* %s, i32 0, i32 1
  %1 = load %struct.xx** %b4, align 8
  %cmp5 = icmp ne %struct.xx* %1, %s
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %c7 = getelementptr inbounds %struct.xx* %s, i32 0, i32 2
  %2 = load i16* %c7, align 2
  %conv = sext i16 %2 to i32
  %cmp8 = icmp ne i32 %conv, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
