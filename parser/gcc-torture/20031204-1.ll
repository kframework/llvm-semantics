; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.addr = internal global [19 x i8] c"10.11.12.13:/hello\00", align 16

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

define i64 @in_aton(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  store i8* %x, i8** %x.addr, align 8
  ret i64 168496141
}

define i64 @root_nfs_parse_addr(i8* %name) nounwind uwtable {
entry:
  %name.addr = alloca i8*, align 8
  %addr = alloca i64, align 8
  %octets = alloca i32, align 4
  %cp = alloca i8*, align 8
  %cq = alloca i8*, align 8
  store i8* %name, i8** %name.addr, align 8
  store i32 0, i32* %octets, align 4
  %tmp = load i8** %name.addr, align 8
  store i8* %tmp, i8** %cq, align 8
  store i8* %tmp, i8** %cp, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end40, %entry
  %tmp1 = load i32* %octets, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %while.body, label %while.end42

while.body:                                       ; preds = %while.cond
  br label %while.cond2

while.cond2:                                      ; preds = %while.body12, %while.body
  %tmp3 = load i8** %cp, align 8
  %tmp4 = load i8* %tmp3
  %conv = sext i8 %tmp4 to i32
  %cmp5 = icmp sge i32 %conv, 48
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond2
  %tmp7 = load i8** %cp, align 8
  %tmp8 = load i8* %tmp7
  %conv9 = sext i8 %tmp8 to i32
  %cmp10 = icmp sle i32 %conv9, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond2
  %0 = phi i1 [ false, %while.cond2 ], [ %cmp10, %land.rhs ]
  br i1 %0, label %while.body12, label %while.end

while.body12:                                     ; preds = %land.end
  %tmp13 = load i8** %cp, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp13, i32 1
  store i8* %incdec.ptr, i8** %cp, align 8
  br label %while.cond2

while.end:                                        ; preds = %land.end
  %tmp14 = load i8** %cp, align 8
  %tmp15 = load i8** %cq, align 8
  %cmp16 = icmp eq i8* %tmp14, %tmp15
  br i1 %cmp16, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %tmp18 = load i8** %cp, align 8
  %tmp19 = load i8** %cq, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %tmp18 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %tmp19 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp20 = icmp sgt i64 %sub.ptr.sub, 3
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.end
  br label %while.end42

if.end:                                           ; preds = %lor.lhs.false
  %tmp22 = load i8** %cp, align 8
  %tmp23 = load i8* %tmp22
  %conv24 = sext i8 %tmp23 to i32
  %cmp25 = icmp eq i32 %conv24, 46
  br i1 %cmp25, label %if.then31, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %if.end
  %tmp28 = load i32* %octets, align 4
  %cmp29 = icmp eq i32 %tmp28, 3
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %lor.lhs.false27, %if.end
  %tmp32 = load i32* %octets, align 4
  %inc = add nsw i32 %tmp32, 1
  store i32 %inc, i32* %octets, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %lor.lhs.false27
  %tmp34 = load i32* %octets, align 4
  %cmp35 = icmp slt i32 %tmp34, 4
  br i1 %cmp35, label %if.then37, label %if.end40

if.then37:                                        ; preds = %if.end33
  %tmp38 = load i8** %cp, align 8
  %incdec.ptr39 = getelementptr inbounds i8* %tmp38, i32 1
  store i8* %incdec.ptr39, i8** %cp, align 8
  br label %if.end40

if.end40:                                         ; preds = %if.then37, %if.end33
  %tmp41 = load i8** %cp, align 8
  store i8* %tmp41, i8** %cq, align 8
  br label %while.cond

while.end42:                                      ; preds = %if.then, %while.cond
  %tmp43 = load i32* %octets, align 4
  %cmp44 = icmp eq i32 %tmp43, 4
  br i1 %cmp44, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.end42
  %tmp46 = load i8** %cp, align 8
  %tmp47 = load i8* %tmp46
  %conv48 = sext i8 %tmp47 to i32
  %cmp49 = icmp eq i32 %conv48, 58
  br i1 %cmp49, label %if.then57, label %lor.lhs.false51

lor.lhs.false51:                                  ; preds = %land.lhs.true
  %tmp52 = load i8** %cp, align 8
  %tmp53 = load i8* %tmp52
  %conv54 = sext i8 %tmp53 to i32
  %cmp55 = icmp eq i32 %conv54, 0
  br i1 %cmp55, label %if.then57, label %if.else

if.then57:                                        ; preds = %lor.lhs.false51, %land.lhs.true
  %tmp58 = load i8** %cp, align 8
  %tmp59 = load i8* %tmp58
  %conv60 = sext i8 %tmp59 to i32
  %cmp61 = icmp eq i32 %conv60, 58
  br i1 %cmp61, label %if.then63, label %if.end66

if.then63:                                        ; preds = %if.then57
  %tmp64 = load i8** %cp, align 8
  %incdec.ptr65 = getelementptr inbounds i8* %tmp64, i32 1
  store i8* %incdec.ptr65, i8** %cp, align 8
  store i8 0, i8* %tmp64
  br label %if.end66

if.end66:                                         ; preds = %if.then63, %if.then57
  %tmp67 = load i8** %name.addr, align 8
  %call = call i64 @in_aton(i8* %tmp67)
  store i64 %call, i64* %addr, align 8
  %tmp68 = load i8** %name.addr, align 8
  %tmp69 = load i8** %cp, align 8
  %call70 = call i8* @strcpy(i8* %tmp68, i8* %tmp69) nounwind
  br label %if.end71

if.else:                                          ; preds = %lor.lhs.false51, %while.end42
  store i64 -1, i64* %addr, align 8
  br label %if.end71

if.end71:                                         ; preds = %if.else, %if.end66
  %tmp72 = load i64* %addr, align 8
  ret i64 %tmp72
}

declare i8* @strcpy(i8*, i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %result = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @root_nfs_parse_addr(i8* getelementptr inbounds ([19 x i8]* @main.addr, i32 0, i32 0))
  store i64 %call, i64* %result, align 8
  %tmp = load i64* %result, align 8
  %cmp = icmp ne i64 %tmp, 168496141
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
