; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/gcc-loop3c.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [26 x i8] c"a[0x10] || a[0x08] == %d\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @f(i32 %m) nounwind uwtable {
entry:
  %tmp3 = add i32 %m, 4
  %tmp6 = shl i32 %m, 3
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %indvar = phi i32 [ %indvar.next, %do.body ], [ 0, %entry ]
  %shr2 = phi i32 [ %shr, %do.body ], [ 256, %entry ]
  %tmp = shl i32 %indvar, 2
  %add = add i32 %tmp3, %tmp
  %tmp5 = shl i32 %indvar, 5
  %shl = add i32 %tmp6, %tmp5
  %idx.ext = zext i32 %shl to i64
  %add.ptr = getelementptr inbounds i8* bitcast ([255 x i8*]* @a to i8*), i64 %idx.ext
  %shr = ashr i32 %shr2, 1
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [255 x i8*]* @a, i64 0, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx, align 8
  %cmp = icmp slt i32 %add, 1073741840
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  ret void
}

define i32 @main() noreturn nounwind uwtable {
f.exit:
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16
  %tmp = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  %tobool = icmp eq i8* %tmp, null
  br i1 %tobool, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %f.exit
  %tmp1 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  %tobool2 = icmp ne i8* %tmp1, null
  br label %lor.end

lor.end:                                          ; preds = %f.exit, %lor.rhs
  %0 = phi i1 [ true, %f.exit ], [ %tobool2, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32 %lor.ext) nounwind
  %tmp3 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  %tobool4 = icmp eq i8* %tmp3, null
  %tmp5 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  %tobool6 = icmp eq i8* %tmp5, null
  %or.cond = and i1 %tobool4, %tobool6
  br i1 %or.cond, label %lor.end12, label %if.then

if.then:                                          ; preds = %lor.end
  tail call void @abort() noreturn nounwind
  unreachable

lor.end12:                                        ; preds = %lor.end
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 4) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 64), align 16
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 32), align 16
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 12) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32 1) nounwind
  %tmp15 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  %tobool16 = icmp ne i8* %tmp15, null
  %tmp18 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  %tobool19 = icmp eq i8* %tmp18, null
  %or.cond1 = and i1 %tobool16, %tobool19
  br i1 %or.cond1, label %if.end21, label %if.then20

if.then20:                                        ; preds = %lor.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %lor.end12
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
