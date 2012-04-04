; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050826-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtattr = type { i16, i16 }

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

define i32 @inet_check_attr(i8* nocapture %r, %struct.rtattr** %rta) nounwind uwtable noinline {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.then18, %for.body, %if.end, %entry
  %indvar = phi i64 [ 0, %entry ], [ %tmp3, %if.end ], [ %tmp3, %for.body ], [ %tmp3, %if.then18 ]
  %tmp = add i64 %indvar, 4294967289
  %storemerge.off = trunc i64 %tmp to i32
  %arrayidx = getelementptr %struct.rtattr** %rta, i64 %indvar
  %tmp3 = add i64 %indvar, 1
  %storemerge = trunc i64 %tmp3 to i32
  %cmp = icmp slt i32 %storemerge, 15
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %tmp4 = load %struct.rtattr** %arrayidx, align 8
  %tobool = icmp eq %struct.rtattr* %tmp4, null
  br i1 %tobool, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  %rta_len = getelementptr inbounds %struct.rtattr* %tmp4, i64 0, i32 0
  %tmp7 = load i16* %rta_len, align 2
  %conv = zext i16 %tmp7 to i64
  %sub8 = add i64 %conv, -4
  %cmp9 = icmp ult i64 %sub8, 4
  br i1 %cmp9, label %return, label %if.end

if.end:                                           ; preds = %if.then
  %switch = icmp ult i32 %storemerge.off, 2
  br i1 %switch, label %for.cond, label %if.then18

if.then18:                                        ; preds = %if.end
  %add.ptr = getelementptr inbounds %struct.rtattr* %tmp4, i64 1
  store %struct.rtattr* %add.ptr, %struct.rtattr** %arrayidx, align 8
  br label %for.cond

return:                                           ; preds = %for.cond, %if.then
  %storemerge1 = phi i32 [ -22, %if.then ], [ 0, %for.cond ]
  ret i32 %storemerge1
}

define i32 @main() nounwind uwtable {
entry:
  %rt1 = alloca [2 x i32], align 4
  %rt1.sub = getelementptr inbounds [2 x i32]* %rt1, i64 0, i64 0
  %tmpcast = bitcast [2 x i32]* %rt1 to [2 x %struct.rtattr]*
  %rta = alloca [14 x %struct.rtattr*], align 16
  %rta_len = bitcast [2 x i32]* %rt1 to i16*
  store i16 12, i16* %rta_len, align 4
  %rta_type = getelementptr inbounds [2 x %struct.rtattr]* %tmpcast, i64 0, i64 0, i32 1
  store i16 0, i16* %rta_type, align 2
  %arrayidx2 = getelementptr inbounds [2 x i32]* %rt1, i64 0, i64 1
  %0 = load i32* %rt1.sub, align 4
  store i32 %0, i32* %arrayidx2, align 4
  %arrayidx6 = bitcast [2 x i32]* %rt1 to %struct.rtattr*
  %arrayidx8 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 0
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8, align 16
  %arrayidx8.1 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 1
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.1, align 8
  %arrayidx8.2 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 2
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.2, align 16
  %arrayidx8.3 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 3
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.3, align 8
  %arrayidx8.4 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 4
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.4, align 16
  %arrayidx8.5 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 5
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.5, align 8
  %arrayidx8.6 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 6
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.6, align 16
  %arrayidx8.7 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 7
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.7, align 8
  %arrayidx8.8 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 8
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.8, align 16
  %arrayidx8.9 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 9
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.9, align 8
  %arrayidx8.10 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 10
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.10, align 16
  %arrayidx8.11 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 11
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.11, align 8
  %arrayidx8.12 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 12
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.12, align 16
  %arrayidx8.13 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 13
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.13, align 8
  %call = call i32 @inet_check_attr(i8* null, %struct.rtattr** %arrayidx8)
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %for.cond11, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

for.cond11:                                       ; preds = %entry, %for.inc28
  %indvar14 = phi i64 [ %indvar.next15, %for.inc28 ], [ 0, %entry ]
  %storemerge2 = trunc i64 %indvar14 to i32
  %cmp13 = icmp slt i32 %storemerge2, 14
  br i1 %cmp13, label %for.body14, label %for.cond32.preheader

for.cond32.preheader:                             ; preds = %for.cond11
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.2, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.3, align 8
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.4, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.6, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.7, align 8
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.8, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.9, align 8
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.10, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.11, align 8
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.12, align 16
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8.13, align 8
  store %struct.rtattr* null, %struct.rtattr** %arrayidx8.1, align 8
  %rta_len46 = bitcast i32* %arrayidx2 to i16*
  %tmp47 = load i16* %rta_len46, align 4
  %sub = add i16 %tmp47, -8
  store i16 %sub, i16* %rta_len46, align 4
  %1 = bitcast i32* %arrayidx2 to %struct.rtattr*
  store %struct.rtattr* %1, %struct.rtattr** %arrayidx8.5, align 8
  %call52 = call i32 @inet_check_attr(i8* null, %struct.rtattr** %arrayidx8)
  %cmp53 = icmp eq i32 %call52, -22
  br i1 %cmp53, label %for.cond57, label %if.then55

for.body14:                                       ; preds = %for.cond11
  %tmp = add i64 %indvar14, 4294967289
  %arrayidx17 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 %indvar14
  %storemerge2.off = trunc i64 %tmp to i32
  %tmp18 = load %struct.rtattr** %arrayidx17, align 8
  %2 = icmp ugt i32 %storemerge2.off, 1
  %idxprom23 = zext i1 %2 to i64
  %arrayidx24 = getelementptr inbounds [2 x %struct.rtattr]* %tmpcast, i64 0, i64 %idxprom23
  %cmp25 = icmp eq %struct.rtattr* %tmp18, %arrayidx24
  br i1 %cmp25, label %for.inc28, label %if.then26

if.then26:                                        ; preds = %for.body14
  call void @abort() noreturn nounwind
  unreachable

for.inc28:                                        ; preds = %for.body14
  %indvar.next15 = add i64 %indvar14, 1
  br label %for.cond11

if.then55:                                        ; preds = %for.cond32.preheader
  call void @abort() noreturn nounwind
  unreachable

for.cond57:                                       ; preds = %for.cond32.preheader, %for.inc104
  %indvar = phi i64 [ %indvar.next, %for.inc104 ], [ 0, %for.cond32.preheader ]
  %storemerge4 = trunc i64 %indvar to i32
  %arrayidx95 = getelementptr [14 x %struct.rtattr*]* %rta, i64 0, i64 %indvar
  %cmp59 = icmp slt i32 %storemerge4, 14
  br i1 %cmp59, label %for.body61, label %for.end107

for.body61:                                       ; preds = %for.cond57
  %cmp63 = icmp eq i32 %storemerge4, 1
  br i1 %cmp63, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body61
  %tmp68 = load %struct.rtattr** %arrayidx95, align 8
  %cmp69 = icmp eq %struct.rtattr* %tmp68, null
  br i1 %cmp69, label %for.inc104, label %if.then71

if.then71:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %for.body61
  %cmp77 = icmp slt i32 %storemerge4, 6
  %tmp83 = load %struct.rtattr** %arrayidx95, align 8
  br i1 %cmp77, label %land.lhs.true79, label %land.lhs.true92

land.lhs.true79:                                  ; preds = %if.else
  %cmp85 = icmp eq %struct.rtattr* %tmp83, %1
  br i1 %cmp85, label %for.inc104, label %if.then87

if.then87:                                        ; preds = %land.lhs.true79
  call void @abort() noreturn nounwind
  unreachable

land.lhs.true92:                                  ; preds = %if.else
  %cmp98 = icmp eq %struct.rtattr* %tmp83, %arrayidx6
  br i1 %cmp98, label %for.inc104, label %if.then100

if.then100:                                       ; preds = %land.lhs.true92
  call void @abort() noreturn nounwind
  unreachable

for.inc104:                                       ; preds = %land.lhs.true79, %land.lhs.true, %land.lhs.true92
  %indvar.next = add i64 %indvar, 1
  br label %for.cond57

for.end107:                                       ; preds = %for.cond57
  ret i32 0
}

declare void @abort() noreturn nounwind
