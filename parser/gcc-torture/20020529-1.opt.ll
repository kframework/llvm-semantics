; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020529-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.xx = type { i32, %struct.xx*, i16 }

@f1.beenhere = internal unnamed_addr global i32 0, align 4

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

define i32 @foo(%struct.xx* %p, i32 %b, i32 %c, i32 %d) nounwind uwtable {
entry:
  %tobool3 = icmp eq i32 %b, 0
  %c8 = getelementptr inbounds %struct.xx* %p, i64 0, i32 2
  %a10 = getelementptr inbounds %struct.xx* %p, i64 0, i32 0
  %tobool16 = icmp eq i32 %c, 0
  %b25 = getelementptr inbounds %struct.xx* %p, i64 0, i32 1
  br label %for.cond.outer

for.cond.outer:                                   ; preds = %sw.bb, %if.end18, %entry
  %conv221.ph = phi i32 [ %d, %entry ], [ %conv22, %if.end18 ], [ %conv22, %sw.bb ]
  %f1.beenhere.promoted = load i32* @f1.beenhere, align 4
  %tmp = add i32 %f1.beenhere.promoted, 1
  br i1 %tobool3, label %for.cond.us, label %for.cond

for.cond.us:                                      ; preds = %for.cond.outer
  %cmp.i.us = icmp sgt i32 %f1.beenhere.promoted, 1
  br i1 %cmp.i.us, label %if.then.i, label %f1.exit.us

f1.exit.us:                                       ; preds = %for.cond.us
  %cmp2.i.us = icmp sgt i32 %f1.beenhere.promoted, 0
  br i1 %cmp2.i.us, label %if.then, label %if.end5

for.cond:                                         ; preds = %for.cond.outer, %if.end
  %indvar13 = phi i32 [ %indvar.next14, %if.end ], [ 0, %for.cond.outer ]
  %inc.i3 = add i32 %f1.beenhere.promoted, %indvar13
  %inc.i = add i32 %tmp, %indvar13
  %cmp.i = icmp sgt i32 %inc.i3, 1
  br i1 %cmp.i, label %if.then.i, label %f1.exit

if.then.i:                                        ; preds = %for.cond, %for.cond.us
  %inc.i.lcssa = phi i32 [ %tmp, %for.cond.us ], [ %inc.i, %for.cond ]
  store i32 %inc.i.lcssa, i32* @f1.beenhere, align 4
  tail call void @abort() noreturn nounwind
  unreachable

f1.exit:                                          ; preds = %for.cond
  %cmp2.i = icmp sgt i32 %inc.i3, 0
  br i1 %cmp2.i, label %if.then, label %if.end

if.then:                                          ; preds = %f1.exit, %f1.exit.us
  %inc.i.lcssa5 = phi i32 [ %tmp, %f1.exit.us ], [ %inc.i, %f1.exit ]
  store i32 %inc.i.lcssa5, i32* @f1.beenhere, align 4
  ret i32 0

if.end:                                           ; preds = %f1.exit
  %indvar.next14 = add i32 %indvar13, 1
  br label %for.cond

if.end5:                                          ; preds = %f1.exit.us
  store i32 %tmp, i32* @f1.beenhere, align 4
  %conv = trunc i32 %conv221.ph to i16
  store i16 %conv, i16* %c8, align 2
  %tmp11 = load i32* %a10, align 4
  %tobool12 = icmp eq i32 %tmp11, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end5
  tail call void @f2()
  unreachable

if.end14:                                         ; preds = %if.end5
  br i1 %tobool16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end14
  tail call void @f2()
  unreachable

if.end18:                                         ; preds = %if.end14
  %conv22 = sext i16 %conv to i32
  br i1 %cmp2.i.us, label %sw.bb, label %for.cond.outer

sw.bb:                                            ; preds = %if.end18
  %tmp26 = load %struct.xx** %b25, align 8
  %tobool27 = icmp eq %struct.xx* %tmp26, null
  br i1 %tobool27, label %for.cond.outer, label %if.then28

if.then28:                                        ; preds = %sw.bb
  tail call void @f2()
  unreachable
}

define i32 @f1(%struct.xx* nocapture %p) nounwind uwtable {
entry:
  %tmp = load i32* @f1.beenhere, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @f1.beenhere, align 4
  %cmp = icmp sgt i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %cmp2 = icmp sgt i32 %tmp, 0
  %conv = zext i1 %cmp2 to i32
  ret i32 %conv
}

define void @f2() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %s = alloca %struct.xx, align 8
  %a = getelementptr inbounds %struct.xx* %s, i64 0, i32 0
  store i32 0, i32* %a, align 8
  %b = getelementptr inbounds %struct.xx* %s, i64 0, i32 1
  store %struct.xx* %s, %struct.xx** %b, align 8
  %c = getelementptr inbounds %struct.xx* %s, i64 0, i32 2
  store i16 23, i16* %c, align 8
  %call = call i32 @foo(%struct.xx* %s, i32 0, i32 0, i32 0)
  %tmp = load i32* %a, align 8
  %cmp2 = icmp eq i32 %tmp, 0
  br i1 %cmp2, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %entry
  %tmp5 = load %struct.xx** %b, align 8
  %cmp6 = icmp eq %struct.xx* %tmp5, %s
  br i1 %cmp6, label %lor.lhs.false7, label %if.then

lor.lhs.false7:                                   ; preds = %lor.lhs.false3
  %tmp9 = load i16* %c, align 8
  %cmp10 = icmp eq i16 %tmp9, 0
  br i1 %cmp10, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false3, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false7
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
