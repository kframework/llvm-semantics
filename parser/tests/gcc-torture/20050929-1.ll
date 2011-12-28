; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050929-1.c'
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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %a = getelementptr inbounds %struct.B* %tmp, i32 0, i32 0
  %tmp1 = load %struct.A** %a, align 8
  %i = getelementptr inbounds %struct.A* %tmp1, i32 0, i32 0
  %tmp2 = load i32* %i, align 4
  %cmp = icmp ne i32 %tmp2, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp3 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %a4 = getelementptr inbounds %struct.B* %tmp3, i32 0, i32 0
  %tmp5 = load %struct.A** %a4, align 8
  %j = getelementptr inbounds %struct.A* %tmp5, i32 0, i32 1
  %tmp6 = load i32* %j, align 4
  %cmp7 = icmp ne i32 %tmp6, 2
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %tmp8 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %b = getelementptr inbounds %struct.B* %tmp8, i32 0, i32 1
  %tmp9 = load %struct.A** %b, align 8
  %i10 = getelementptr inbounds %struct.A* %tmp9, i32 0, i32 0
  %tmp11 = load i32* %i10, align 4
  %cmp12 = icmp ne i32 %tmp11, 3
  br i1 %cmp12, label %if.then20, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %if.end
  %tmp14 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %b15 = getelementptr inbounds %struct.B* %tmp14, i32 0, i32 1
  %tmp16 = load %struct.A** %b15, align 8
  %j17 = getelementptr inbounds %struct.A* %tmp16, i32 0, i32 1
  %tmp18 = load i32* %j17, align 4
  %cmp19 = icmp ne i32 %tmp18, 4
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %lor.lhs.false13, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %lor.lhs.false13
  %tmp22 = load %struct.A** getelementptr inbounds (%struct.C* @e, i32 0, i32 1), align 8
  %i23 = getelementptr inbounds %struct.A* %tmp22, i32 0, i32 0
  %tmp24 = load i32* %i23, align 4
  %cmp25 = icmp ne i32 %tmp24, 5
  br i1 %cmp25, label %if.then31, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %if.end21
  %tmp27 = load %struct.A** getelementptr inbounds (%struct.C* @e, i32 0, i32 1), align 8
  %j28 = getelementptr inbounds %struct.A* %tmp27, i32 0, i32 1
  %tmp29 = load i32* %j28, align 4
  %cmp30 = icmp ne i32 %tmp29, 6
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lor.lhs.false26, %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %lor.lhs.false26
  ret i32 0
}

declare void @abort() noreturn nounwind
