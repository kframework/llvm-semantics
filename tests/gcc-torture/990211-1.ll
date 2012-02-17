; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990211-1.c'
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

define void @func(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %i.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  %tmp3 = load i32* %i.addr, align 4
  %cmp4 = icmp sgt i32 %tmp3, 0
  br i1 %cmp4, label %land.lhs.true5, label %if.end9

land.lhs.true5:                                   ; preds = %if.end
  %tmp6 = load i32* %i.addr, align 4
  %cmp7 = icmp sle i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true5
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %land.lhs.true5, %if.end
  %tmp10 = load i32* %i.addr, align 4
  %cmp11 = icmp sge i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %if.end16

land.lhs.true12:                                  ; preds = %if.end9
  %tmp13 = load i32* %i.addr, align 4
  %cmp14 = icmp slt i32 %tmp13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %land.lhs.true12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %land.lhs.true12, %if.end9
  %tmp17 = load i32* %i.addr, align 4
  %cmp18 = icmp sle i32 %tmp17, 0
  br i1 %cmp18, label %land.lhs.true19, label %if.end23

land.lhs.true19:                                  ; preds = %if.end16
  %tmp20 = load i32* %i.addr, align 4
  %cmp21 = icmp sgt i32 %tmp20, 0
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %land.lhs.true19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %land.lhs.true19, %if.end16
  %tmp24 = load i32* %i.addr, align 4
  %cmp25 = icmp slt i32 %tmp24, 77
  br i1 %cmp25, label %land.lhs.true26, label %if.end30

land.lhs.true26:                                  ; preds = %if.end23
  %tmp27 = load i32* %i.addr, align 4
  %cmp28 = icmp sge i32 %tmp27, 77
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %land.lhs.true26
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %land.lhs.true26, %if.end23
  %tmp31 = load i32* %i.addr, align 4
  %cmp32 = icmp sgt i32 %tmp31, 77
  br i1 %cmp32, label %land.lhs.true33, label %if.end37

land.lhs.true33:                                  ; preds = %if.end30
  %tmp34 = load i32* %i.addr, align 4
  %cmp35 = icmp sle i32 %tmp34, 77
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %land.lhs.true33
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %land.lhs.true33, %if.end30
  %tmp38 = load i32* %i.addr, align 4
  %cmp39 = icmp sge i32 %tmp38, 77
  br i1 %cmp39, label %land.lhs.true40, label %if.end44

land.lhs.true40:                                  ; preds = %if.end37
  %tmp41 = load i32* %i.addr, align 4
  %cmp42 = icmp slt i32 %tmp41, 77
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %land.lhs.true40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %land.lhs.true40, %if.end37
  %tmp45 = load i32* %i.addr, align 4
  %cmp46 = icmp sle i32 %tmp45, 77
  br i1 %cmp46, label %land.lhs.true47, label %if.end51

land.lhs.true47:                                  ; preds = %if.end44
  %tmp48 = load i32* %i.addr, align 4
  %cmp49 = icmp sgt i32 %tmp48, 77
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %land.lhs.true47
  call void @abort() noreturn nounwind
  unreachable

if.end51:                                         ; preds = %land.lhs.true47, %if.end44
  %tmp52 = load i32* %i.addr, align 4
  %cmp53 = icmp slt i32 %tmp52, 0
  br i1 %cmp53, label %if.end57, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end51
  %tmp54 = load i32* %i.addr, align 4
  %cmp55 = icmp sge i32 %tmp54, 0
  br i1 %cmp55, label %if.end57, label %if.then56

if.then56:                                        ; preds = %lor.lhs.false
  call void @abort() noreturn nounwind
  unreachable

if.end57:                                         ; preds = %lor.lhs.false, %if.end51
  %tmp58 = load i32* %i.addr, align 4
  %cmp59 = icmp sgt i32 %tmp58, 0
  br i1 %cmp59, label %if.end64, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %if.end57
  %tmp61 = load i32* %i.addr, align 4
  %cmp62 = icmp sle i32 %tmp61, 0
  br i1 %cmp62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %lor.lhs.false60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %lor.lhs.false60, %if.end57
  %tmp65 = load i32* %i.addr, align 4
  %cmp66 = icmp sge i32 %tmp65, 0
  br i1 %cmp66, label %if.end71, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %if.end64
  %tmp68 = load i32* %i.addr, align 4
  %cmp69 = icmp slt i32 %tmp68, 0
  br i1 %cmp69, label %if.end71, label %if.then70

if.then70:                                        ; preds = %lor.lhs.false67
  call void @abort() noreturn nounwind
  unreachable

if.end71:                                         ; preds = %lor.lhs.false67, %if.end64
  %tmp72 = load i32* %i.addr, align 4
  %cmp73 = icmp sle i32 %tmp72, 0
  br i1 %cmp73, label %if.end78, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %if.end71
  %tmp75 = load i32* %i.addr, align 4
  %cmp76 = icmp sgt i32 %tmp75, 0
  br i1 %cmp76, label %if.end78, label %if.then77

if.then77:                                        ; preds = %lor.lhs.false74
  call void @abort() noreturn nounwind
  unreachable

if.end78:                                         ; preds = %lor.lhs.false74, %if.end71
  %tmp79 = load i32* %i.addr, align 4
  %cmp80 = icmp slt i32 %tmp79, 77
  br i1 %cmp80, label %if.end85, label %lor.lhs.false81

lor.lhs.false81:                                  ; preds = %if.end78
  %tmp82 = load i32* %i.addr, align 4
  %cmp83 = icmp sge i32 %tmp82, 77
  br i1 %cmp83, label %if.end85, label %if.then84

if.then84:                                        ; preds = %lor.lhs.false81
  call void @abort() noreturn nounwind
  unreachable

if.end85:                                         ; preds = %lor.lhs.false81, %if.end78
  %tmp86 = load i32* %i.addr, align 4
  %cmp87 = icmp sgt i32 %tmp86, 77
  br i1 %cmp87, label %if.end92, label %lor.lhs.false88

lor.lhs.false88:                                  ; preds = %if.end85
  %tmp89 = load i32* %i.addr, align 4
  %cmp90 = icmp sle i32 %tmp89, 77
  br i1 %cmp90, label %if.end92, label %if.then91

if.then91:                                        ; preds = %lor.lhs.false88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %lor.lhs.false88, %if.end85
  %tmp93 = load i32* %i.addr, align 4
  %cmp94 = icmp sge i32 %tmp93, 77
  br i1 %cmp94, label %if.end99, label %lor.lhs.false95

lor.lhs.false95:                                  ; preds = %if.end92
  %tmp96 = load i32* %i.addr, align 4
  %cmp97 = icmp slt i32 %tmp96, 77
  br i1 %cmp97, label %if.end99, label %if.then98

if.then98:                                        ; preds = %lor.lhs.false95
  call void @abort() noreturn nounwind
  unreachable

if.end99:                                         ; preds = %lor.lhs.false95, %if.end92
  %tmp100 = load i32* %i.addr, align 4
  %cmp101 = icmp sle i32 %tmp100, 77
  br i1 %cmp101, label %if.end106, label %lor.lhs.false102

lor.lhs.false102:                                 ; preds = %if.end99
  %tmp103 = load i32* %i.addr, align 4
  %cmp104 = icmp sgt i32 %tmp103, 77
  br i1 %cmp104, label %if.end106, label %if.then105

if.then105:                                       ; preds = %lor.lhs.false102
  call void @abort() noreturn nounwind
  unreachable

if.end106:                                        ; preds = %lor.lhs.false102, %if.end99
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @func(i32 0)
  call void @func(i32 1)
  ret i32 0
}
