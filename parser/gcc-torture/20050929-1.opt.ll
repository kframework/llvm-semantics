; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050929-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { %struct.A*, %struct.A* }
%struct.C = type { %struct.B*, %struct.A* }

@.compoundliteral = internal global %struct.A { i32 1, i32 2 }
@.compoundliteral1 = internal global %struct.A { i32 3, i32 4 }
@.compoundliteral2 = internal global %struct.B { %struct.A* @.compoundliteral, %struct.A* @.compoundliteral1 }
@.compoundliteral3 = internal global %struct.A { i32 5, i32 6 }
@e = global %struct.C { %struct.B* @.compoundliteral2, %struct.A* @.compoundliteral3 }, align 8

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

define i32 @main() nounwind uwtable {
entry:
  %tmp = load %struct.B** getelementptr inbounds (%struct.C* @e, i64 0, i32 0), align 8
  %a = getelementptr inbounds %struct.B* %tmp, i64 0, i32 0
  %tmp1 = load %struct.A** %a, align 8
  %i = getelementptr inbounds %struct.A* %tmp1, i64 0, i32 0
  %tmp2 = load i32* %i, align 4
  %cmp = icmp eq i32 %tmp2, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %j = getelementptr inbounds %struct.A* %tmp1, i64 0, i32 1
  %tmp6 = load i32* %j, align 4
  %cmp7 = icmp eq i32 %tmp6, 2
  br i1 %cmp7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %b = getelementptr inbounds %struct.B* %tmp, i64 0, i32 1
  %tmp9 = load %struct.A** %b, align 8
  %i10 = getelementptr inbounds %struct.A* %tmp9, i64 0, i32 0
  %tmp11 = load i32* %i10, align 4
  %cmp12 = icmp eq i32 %tmp11, 3
  br i1 %cmp12, label %lor.lhs.false13, label %if.then20

lor.lhs.false13:                                  ; preds = %if.end
  %j17 = getelementptr inbounds %struct.A* %tmp9, i64 0, i32 1
  %tmp18 = load i32* %j17, align 4
  %cmp19 = icmp eq i32 %tmp18, 4
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %lor.lhs.false13, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %lor.lhs.false13
  %tmp22 = load %struct.A** getelementptr inbounds (%struct.C* @e, i64 0, i32 1), align 8
  %i23 = getelementptr inbounds %struct.A* %tmp22, i64 0, i32 0
  %tmp24 = load i32* %i23, align 4
  %cmp25 = icmp eq i32 %tmp24, 5
  br i1 %cmp25, label %lor.lhs.false26, label %if.then31

lor.lhs.false26:                                  ; preds = %if.end21
  %j28 = getelementptr inbounds %struct.A* %tmp22, i64 0, i32 1
  %tmp29 = load i32* %j28, align 4
  %cmp30 = icmp eq i32 %tmp29, 6
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %lor.lhs.false26, %if.end21
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %lor.lhs.false26
  ret i32 0
}

declare void @abort() noreturn nounwind
