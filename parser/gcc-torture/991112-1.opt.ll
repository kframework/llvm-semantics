; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991112-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define i32 @rl_show_char(i32 %c) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @rl_character_len(i32 %c, i32 %pos) nounwind uwtable readonly {
entry:
  %idxprom = sext i32 %c to i64
  %call = tail call i16** @__ctype_b_loc() nounwind readnone
  %tmp1 = load i16** %call, align 8
  %arrayidx = getelementptr inbounds i16* %tmp1, i64 %idxprom
  %tmp2 = load i16* %arrayidx, align 2
  %and = and i16 %tmp2, 16384
  %tobool = icmp ne i16 %and, 0
  %cond = select i1 %tobool, i32 1, i32 2
  ret i32 %cond
}

declare i16** @__ctype_b_loc() readnone

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i16** @__ctype_b_loc() nounwind readnone
  %tmp1.i = load i16** %call.i, align 8
  %arrayidx.i = getelementptr inbounds i16* %tmp1.i, i64 97
  %tmp2.i = load i16* %arrayidx.i, align 2
  %and.i = and i16 %tmp2.i, 16384
  %tobool.i = icmp eq i16 %and.i, 0
  br i1 %tobool.i, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx.i3 = getelementptr inbounds i16* %tmp1.i, i64 2
  %tmp2.i4 = load i16* %arrayidx.i3, align 2
  %and.i5 = and i16 %tmp2.i4, 16384
  %not.tobool.i6 = icmp eq i16 %and.i5, 0
  br i1 %not.tobool.i6, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
