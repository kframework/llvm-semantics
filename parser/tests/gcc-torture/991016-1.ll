; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991016-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define i32 @doit(i32 %sel, i32 %n, i8* %p) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %sel.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %p.addr = alloca i8*, align 8
  %p0 = alloca i32*, align 8
  %p1 = alloca i64*, align 8
  %p2 = alloca i64*, align 8
  store i32 %sel, i32* %sel.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %p, i8** %p.addr, align 8
  %tmp = load i8** %p.addr, align 8
  %0 = bitcast i8* %tmp to i32*
  store i32* %0, i32** %p0, align 8
  %tmp2 = load i8** %p.addr, align 8
  %1 = bitcast i8* %tmp2 to i64*
  store i64* %1, i64** %p1, align 8
  %tmp4 = load i8** %p.addr, align 8
  %2 = bitcast i8* %tmp4 to i64*
  store i64* %2, i64** %p2, align 8
  %tmp5 = load i32* %sel.addr, align 4
  switch i32 %tmp5, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb13
    i32 2, label %sw.bb29
  ]

sw.bb:                                            ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb
  %tmp6 = load i32** %p0, align 8
  %tmp7 = load i32* %tmp6
  %tmp8 = load i32** %p0, align 8
  %tmp9 = load i32* %tmp8
  %add = add nsw i32 %tmp9, %tmp7
  store i32 %add, i32* %tmp8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp10 = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp10, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %dec, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %tmp11 = load i32** %p0, align 8
  %tmp12 = load i32* %tmp11
  %cmp = icmp eq i32 %tmp12, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %retval
  br label %return

sw.bb13:                                          ; preds = %entry
  br label %do.body14

do.body14:                                        ; preds = %do.cond20, %sw.bb13
  %tmp15 = load i64** %p1, align 8
  %tmp16 = load i64* %tmp15
  %tmp17 = load i64** %p1, align 8
  %tmp18 = load i64* %tmp17
  %add19 = add nsw i64 %tmp18, %tmp16
  store i64 %add19, i64* %tmp17
  br label %do.cond20

do.cond20:                                        ; preds = %do.body14
  %tmp21 = load i32* %n.addr, align 4
  %dec22 = add nsw i32 %tmp21, -1
  store i32 %dec22, i32* %n.addr, align 4
  %tobool23 = icmp ne i32 %dec22, 0
  br i1 %tobool23, label %do.body14, label %do.end24

do.end24:                                         ; preds = %do.cond20
  %tmp25 = load i64** %p1, align 8
  %tmp26 = load i64* %tmp25
  %cmp27 = icmp eq i64 %tmp26, 0
  %conv28 = zext i1 %cmp27 to i32
  store i32 %conv28, i32* %retval
  br label %return

sw.bb29:                                          ; preds = %entry
  br label %do.body30

do.body30:                                        ; preds = %do.cond36, %sw.bb29
  %tmp31 = load i64** %p2, align 8
  %tmp32 = load i64* %tmp31
  %tmp33 = load i64** %p2, align 8
  %tmp34 = load i64* %tmp33
  %add35 = add nsw i64 %tmp34, %tmp32
  store i64 %add35, i64* %tmp33
  br label %do.cond36

do.cond36:                                        ; preds = %do.body30
  %tmp37 = load i32* %n.addr, align 4
  %dec38 = add nsw i32 %tmp37, -1
  store i32 %dec38, i32* %n.addr, align 4
  %tobool39 = icmp ne i32 %dec38, 0
  br i1 %tobool39, label %do.body30, label %do.end40

do.end40:                                         ; preds = %do.cond36
  %tmp41 = load i64** %p2, align 8
  %tmp42 = load i64* %tmp41
  %cmp43 = icmp eq i64 %tmp42, 0
  %conv44 = zext i1 %cmp43 to i32
  store i32 %conv44, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %do.end40, %do.end24, %do.end
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %v0 = alloca i32, align 4
  %v1 = alloca i64, align 8
  %v2 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 1, i32* %v0, align 4
  %0 = bitcast i32* %v0 to i8*
  %call = call i32 @doit(i32 0, i32 5, i8* %0)
  store i64 1, i64* %v1, align 8
  %1 = bitcast i64* %v1 to i8*
  %call1 = call i32 @doit(i32 1, i32 5, i8* %1)
  store i64 1, i64* %v2, align 8
  %2 = bitcast i64* %v2 to i8*
  %call2 = call i32 @doit(i32 2, i32 5, i8* %2)
  %tmp = load i32* %v0, align 4
  %cmp = icmp ne i32 %tmp, 32
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp3 = load i64* %v1, align 8
  %cmp4 = icmp ne i64 %tmp3, 32
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %tmp7 = load i64* %v2, align 8
  %cmp8 = icmp ne i64 %tmp7, 32
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind
