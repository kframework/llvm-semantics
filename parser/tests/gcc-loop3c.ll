; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/gcc-loop3c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [26 x i8] c"a[0x10] || a[0x08] == %d\0A\00", align 1

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

define void @f(i32 %m) nounwind uwtable {
entry:
  %m.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sh = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 256, i32* %sh, align 4
  %tmp = load i32* %m.addr, align 4
  store i32 %tmp, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %tmp1 = load i32* %i, align 4
  %shl = shl i32 %tmp1, 3
  %idx.ext = zext i32 %shl to i64
  %add.ptr = getelementptr inbounds i8* bitcast ([255 x i8*]* @a to i8*), i64 %idx.ext
  %tmp2 = load i32* %sh, align 4
  %shr = ashr i32 %tmp2, 1
  store i32 %shr, i32* %sh, align 4
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [255 x i8*]* @a, i32 0, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx, align 8
  %tmp3 = load i32* %i, align 4
  %add = add nsw i32 %tmp3, 4
  store i32 %add, i32* %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 1073741840
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 1610612736)
  %tmp = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool = icmp ne i8* %tmp, null
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp1 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool2 = icmp ne i8* %tmp1, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool2, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %lor.ext)
  %tmp3 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool4 = icmp ne i8* %tmp3, null
  br i1 %tobool4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %lor.end
  %tmp5 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool6 = icmp ne i8* %tmp5, null
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %lor.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 1073741824)
  %tmp7 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool8 = icmp ne i8* %tmp7, null
  br i1 %tobool8, label %lor.end12, label %lor.rhs9

lor.rhs9:                                         ; preds = %if.end
  %tmp10 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool11 = icmp ne i8* %tmp10, null
  br label %lor.end12

lor.end12:                                        ; preds = %lor.rhs9, %if.end
  %1 = phi i1 [ true, %if.end ], [ %tobool11, %lor.rhs9 ]
  %lor.ext13 = zext i1 %1 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %lor.ext13)
  %tmp15 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool16 = icmp ne i8* %tmp15, null
  br i1 %tobool16, label %lor.lhs.false17, label %if.then20

lor.lhs.false17:                                  ; preds = %lor.end12
  %tmp18 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool19 = icmp ne i8* %tmp18, null
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %lor.lhs.false17, %lor.end12
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %lor.lhs.false17
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare i32 @printf(i8*, ...)

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
