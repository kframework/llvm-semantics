; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/981001-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@flg = global i64 0, align 8

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

define i64 @sub(i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %n, 1
  br i1 %cmp, label %if.then, label %if.else30

if.then:                                          ; preds = %entry
  %rem1 = and i32 %n, 1
  %cmp2 = icmp eq i32 %rem1, 0
  %div = sdiv i32 %n, 2
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %call = tail call i64 @sub(i32 %div)
  %sext = shl i64 %call, 32
  %conv6 = ashr exact i64 %sext, 32
  %sub = add nsw i32 %div, -1
  %call9 = tail call i64 @sub(i32 %sub)
  %mul = shl i64 %call9, 1
  %add = add nsw i64 %conv6, %mul
  %mul12 = mul nsw i64 %add, %conv6
  ret i64 %mul12

if.else:                                          ; preds = %if.then
  %add15 = add nsw i32 %div, 1
  %call16 = tail call i64 @sub(i32 %add15)
  %conv17 = trunc i64 %call16 to i32
  %call20 = tail call i64 @sub(i32 %div)
  %conv21 = trunc i64 %call20 to i32
  %mul24 = mul nsw i32 %conv17, %conv17
  %mul27 = mul nsw i32 %conv21, %conv21
  %add28 = add nsw i32 %mul27, %mul24
  %conv29 = sext i32 %add28 to i64
  ret i64 %conv29

if.else30:                                        ; preds = %entry
  %conv32 = sext i32 %n to i64
  ret i64 %conv32
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i64 @sub(i32 30)
  %cmp = icmp eq i64 %call, 832040
  %tmp1.pr = load i64* @flg, align 8
  br i1 %cmp, label %if.end, label %if.end.thread

if.end.thread:                                    ; preds = %entry
  %or = or i64 %tmp1.pr, 256
  store i64 %or, i64* @flg, align 8
  br label %if.then2

if.end:                                           ; preds = %entry
  %tobool = icmp eq i64 %tmp1.pr, 0
  br i1 %tobool, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end.thread, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
