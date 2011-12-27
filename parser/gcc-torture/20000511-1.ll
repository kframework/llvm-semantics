; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000511-1.c'
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

define void @f(i32 %value, i32 %expect) nounwind uwtable {
entry:
  %value.addr = alloca i32, align 4
  %expect.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  store i32 %expect, i32* %expect.addr, align 4
  %tmp = load i32* %value.addr, align 4
  %tmp1 = load i32* %expect.addr, align 4
  %cmp = icmp ne i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 7, i32* %a, align 4
  store i32 6, i32* %b, align 4
  store i32 4, i32* %c, align 4
  store i32 7, i32* %d, align 4
  store i32 2, i32* %e, align 4
  %tmp = load i32* %a, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp1 = load i32* %b, align 4
  %tmp2 = load i32* %c, align 4
  %rem = srem i32 %tmp1, %tmp2
  %tobool3 = icmp ne i32 %rem, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool3, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  call void @f(i32 %lor.ext, i32 1)
  %tmp4 = load i32* %a, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.end
  %tmp6 = load i32* %b, align 4
  %tmp7 = load i32* %c, align 4
  %rem8 = srem i32 %tmp6, %tmp7
  br label %cond.end

cond.false:                                       ; preds = %lor.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %rem8, %cond.true ], [ 0, %cond.false ]
  call void @f(i32 %cond, i32 2)
  %tmp9 = load i32* %b, align 4
  %tmp10 = load i32* %c, align 4
  %rem11 = srem i32 %tmp9, %tmp10
  store i32 %rem11, i32* %a, align 4
  call void @f(i32 %rem11, i32 2)
  %tmp12 = load i32* %b, align 4
  %tmp13 = load i32* %c, align 4
  %rem14 = srem i32 %tmp12, %tmp13
  %tmp15 = load i32* %a, align 4
  %mul = mul nsw i32 %tmp15, %rem14
  store i32 %mul, i32* %a, align 4
  call void @f(i32 %mul, i32 4)
  %tmp16 = load i32* %b, align 4
  %tmp17 = load i32* %c, align 4
  %rem18 = srem i32 %tmp16, %tmp17
  %tmp19 = load i32* %a, align 4
  %div = sdiv i32 %tmp19, %rem18
  store i32 %div, i32* %a, align 4
  call void @f(i32 %div, i32 2)
  %tmp20 = load i32* %b, align 4
  %tmp21 = load i32* %c, align 4
  %rem22 = srem i32 %tmp20, %tmp21
  %tmp23 = load i32* %a, align 4
  %rem24 = srem i32 %tmp23, %rem22
  store i32 %rem24, i32* %a, align 4
  call void @f(i32 %rem24, i32 0)
  %tmp25 = load i32* %b, align 4
  %tmp26 = load i32* %c, align 4
  %rem27 = srem i32 %tmp25, %tmp26
  %tmp28 = load i32* %a, align 4
  %add = add nsw i32 %tmp28, %rem27
  store i32 %add, i32* %a, align 4
  call void @f(i32 %add, i32 2)
  %tmp29 = load i32* %d, align 4
  %tobool30 = icmp ne i32 %tmp29, 0
  br i1 %tobool30, label %lor.end36, label %lor.rhs31

lor.rhs31:                                        ; preds = %cond.end
  %tmp32 = load i32* %c, align 4
  %tobool33 = icmp ne i32 %tmp32, 0
  br i1 %tobool33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs31
  %tmp34 = load i32* %e, align 4
  %tobool35 = icmp ne i32 %tmp34, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs31
  %1 = phi i1 [ false, %lor.rhs31 ], [ %tobool35, %land.rhs ]
  br label %lor.end36

lor.end36:                                        ; preds = %land.end, %cond.end
  %2 = phi i1 [ true, %cond.end ], [ %1, %land.end ]
  %lor.ext37 = zext i1 %2 to i32
  call void @f(i32 %lor.ext37, i32 1)
  %tmp38 = load i32* %d, align 4
  %tobool39 = icmp ne i32 %tmp38, 0
  br i1 %tobool39, label %cond.true40, label %cond.false47

cond.true40:                                      ; preds = %lor.end36
  %tmp41 = load i32* %c, align 4
  %tobool42 = icmp ne i32 %tmp41, 0
  br i1 %tobool42, label %land.rhs43, label %land.end46

land.rhs43:                                       ; preds = %cond.true40
  %tmp44 = load i32* %e, align 4
  %tobool45 = icmp ne i32 %tmp44, 0
  br label %land.end46

land.end46:                                       ; preds = %land.rhs43, %cond.true40
  %3 = phi i1 [ false, %cond.true40 ], [ %tobool45, %land.rhs43 ]
  %land.ext = zext i1 %3 to i32
  br label %cond.end48

cond.false47:                                     ; preds = %lor.end36
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false47, %land.end46
  %cond49 = phi i32 [ %land.ext, %land.end46 ], [ 0, %cond.false47 ]
  call void @f(i32 %cond49, i32 1)
  %tmp50 = load i32* %c, align 4
  %tobool51 = icmp ne i32 %tmp50, 0
  br i1 %tobool51, label %land.rhs52, label %land.end55

land.rhs52:                                       ; preds = %cond.end48
  %tmp53 = load i32* %e, align 4
  %tobool54 = icmp ne i32 %tmp53, 0
  br label %land.end55

land.end55:                                       ; preds = %land.rhs52, %cond.end48
  %4 = phi i1 [ false, %cond.end48 ], [ %tobool54, %land.rhs52 ]
  %land.ext56 = zext i1 %4 to i32
  store i32 %land.ext56, i32* %d, align 4
  call void @f(i32 %land.ext56, i32 1)
  %tmp57 = load i32* %c, align 4
  %tobool58 = icmp ne i32 %tmp57, 0
  br i1 %tobool58, label %land.rhs59, label %land.end62

land.rhs59:                                       ; preds = %land.end55
  %tmp60 = load i32* %e, align 4
  %tobool61 = icmp ne i32 %tmp60, 0
  br label %land.end62

land.end62:                                       ; preds = %land.rhs59, %land.end55
  %5 = phi i1 [ false, %land.end55 ], [ %tobool61, %land.rhs59 ]
  %land.ext63 = zext i1 %5 to i32
  %tmp64 = load i32* %d, align 4
  %mul65 = mul nsw i32 %tmp64, %land.ext63
  store i32 %mul65, i32* %d, align 4
  call void @f(i32 %mul65, i32 1)
  %tmp66 = load i32* %c, align 4
  %tobool67 = icmp ne i32 %tmp66, 0
  br i1 %tobool67, label %land.rhs68, label %land.end71

land.rhs68:                                       ; preds = %land.end62
  %tmp69 = load i32* %e, align 4
  %tobool70 = icmp ne i32 %tmp69, 0
  br label %land.end71

land.end71:                                       ; preds = %land.rhs68, %land.end62
  %6 = phi i1 [ false, %land.end62 ], [ %tobool70, %land.rhs68 ]
  %land.ext72 = zext i1 %6 to i32
  %tmp73 = load i32* %d, align 4
  %rem74 = srem i32 %tmp73, %land.ext72
  store i32 %rem74, i32* %d, align 4
  call void @f(i32 %rem74, i32 0)
  %tmp75 = load i32* %c, align 4
  %tobool76 = icmp ne i32 %tmp75, 0
  br i1 %tobool76, label %land.rhs77, label %land.end80

land.rhs77:                                       ; preds = %land.end71
  %tmp78 = load i32* %e, align 4
  %tobool79 = icmp ne i32 %tmp78, 0
  br label %land.end80

land.end80:                                       ; preds = %land.rhs77, %land.end71
  %7 = phi i1 [ false, %land.end71 ], [ %tobool79, %land.rhs77 ]
  %land.ext81 = zext i1 %7 to i32
  %tmp82 = load i32* %d, align 4
  %add83 = add nsw i32 %tmp82, %land.ext81
  store i32 %add83, i32* %d, align 4
  call void @f(i32 %add83, i32 1)
  %tmp84 = load i32* %c, align 4
  %tobool85 = icmp ne i32 %tmp84, 0
  br i1 %tobool85, label %land.rhs86, label %land.end89

land.rhs86:                                       ; preds = %land.end80
  %tmp87 = load i32* %e, align 4
  %tobool88 = icmp ne i32 %tmp87, 0
  br label %land.end89

land.end89:                                       ; preds = %land.rhs86, %land.end80
  %8 = phi i1 [ false, %land.end80 ], [ %tobool88, %land.rhs86 ]
  %land.ext90 = zext i1 %8 to i32
  %tmp91 = load i32* %d, align 4
  %sub = sub nsw i32 %tmp91, %land.ext90
  store i32 %sub, i32* %d, align 4
  call void @f(i32 %sub, i32 0)
  %tmp92 = load i32* %d, align 4
  %tobool93 = icmp ne i32 %tmp92, 0
  br i1 %tobool93, label %lor.end99, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.end89
  %tmp94 = load i32* %c, align 4
  %tobool95 = icmp ne i32 %tmp94, 0
  br i1 %tobool95, label %lor.end99, label %lor.rhs96

lor.rhs96:                                        ; preds = %lor.lhs.false
  %tmp97 = load i32* %e, align 4
  %tobool98 = icmp ne i32 %tmp97, 0
  br label %lor.end99

lor.end99:                                        ; preds = %lor.rhs96, %lor.lhs.false, %land.end89
  %9 = phi i1 [ true, %lor.lhs.false ], [ true, %land.end89 ], [ %tobool98, %lor.rhs96 ]
  %lor.ext100 = zext i1 %9 to i32
  call void @f(i32 %lor.ext100, i32 1)
  %tmp101 = load i32* %d, align 4
  %tobool102 = icmp ne i32 %tmp101, 0
  br i1 %tobool102, label %cond.true103, label %cond.false111

cond.true103:                                     ; preds = %lor.end99
  %tmp104 = load i32* %c, align 4
  %tobool105 = icmp ne i32 %tmp104, 0
  br i1 %tobool105, label %lor.end109, label %lor.rhs106

lor.rhs106:                                       ; preds = %cond.true103
  %tmp107 = load i32* %e, align 4
  %tobool108 = icmp ne i32 %tmp107, 0
  br label %lor.end109

lor.end109:                                       ; preds = %lor.rhs106, %cond.true103
  %10 = phi i1 [ true, %cond.true103 ], [ %tobool108, %lor.rhs106 ]
  %lor.ext110 = zext i1 %10 to i32
  br label %cond.end112

cond.false111:                                    ; preds = %lor.end99
  br label %cond.end112

cond.end112:                                      ; preds = %cond.false111, %lor.end109
  %cond113 = phi i32 [ %lor.ext110, %lor.end109 ], [ 0, %cond.false111 ]
  call void @f(i32 %cond113, i32 0)
  %tmp114 = load i32* %c, align 4
  %tobool115 = icmp ne i32 %tmp114, 0
  br i1 %tobool115, label %lor.end119, label %lor.rhs116

lor.rhs116:                                       ; preds = %cond.end112
  %tmp117 = load i32* %e, align 4
  %tobool118 = icmp ne i32 %tmp117, 0
  br label %lor.end119

lor.end119:                                       ; preds = %lor.rhs116, %cond.end112
  %11 = phi i1 [ true, %cond.end112 ], [ %tobool118, %lor.rhs116 ]
  %lor.ext120 = zext i1 %11 to i32
  store i32 %lor.ext120, i32* %d, align 4
  call void @f(i32 %lor.ext120, i32 1)
  %tmp121 = load i32* %c, align 4
  %tobool122 = icmp ne i32 %tmp121, 0
  br i1 %tobool122, label %lor.end126, label %lor.rhs123

lor.rhs123:                                       ; preds = %lor.end119
  %tmp124 = load i32* %e, align 4
  %tobool125 = icmp ne i32 %tmp124, 0
  br label %lor.end126

lor.end126:                                       ; preds = %lor.rhs123, %lor.end119
  %12 = phi i1 [ true, %lor.end119 ], [ %tobool125, %lor.rhs123 ]
  %lor.ext127 = zext i1 %12 to i32
  %tmp128 = load i32* %d, align 4
  %mul129 = mul nsw i32 %tmp128, %lor.ext127
  store i32 %mul129, i32* %d, align 4
  call void @f(i32 %mul129, i32 1)
  %tmp130 = load i32* %c, align 4
  %tobool131 = icmp ne i32 %tmp130, 0
  br i1 %tobool131, label %lor.end135, label %lor.rhs132

lor.rhs132:                                       ; preds = %lor.end126
  %tmp133 = load i32* %e, align 4
  %tobool134 = icmp ne i32 %tmp133, 0
  br label %lor.end135

lor.end135:                                       ; preds = %lor.rhs132, %lor.end126
  %13 = phi i1 [ true, %lor.end126 ], [ %tobool134, %lor.rhs132 ]
  %lor.ext136 = zext i1 %13 to i32
  %tmp137 = load i32* %d, align 4
  %rem138 = srem i32 %tmp137, %lor.ext136
  store i32 %rem138, i32* %d, align 4
  call void @f(i32 %rem138, i32 0)
  %tmp139 = load i32* %c, align 4
  %tobool140 = icmp ne i32 %tmp139, 0
  br i1 %tobool140, label %lor.end144, label %lor.rhs141

lor.rhs141:                                       ; preds = %lor.end135
  %tmp142 = load i32* %e, align 4
  %tobool143 = icmp ne i32 %tmp142, 0
  br label %lor.end144

lor.end144:                                       ; preds = %lor.rhs141, %lor.end135
  %14 = phi i1 [ true, %lor.end135 ], [ %tobool143, %lor.rhs141 ]
  %lor.ext145 = zext i1 %14 to i32
  %tmp146 = load i32* %d, align 4
  %add147 = add nsw i32 %tmp146, %lor.ext145
  store i32 %add147, i32* %d, align 4
  call void @f(i32 %add147, i32 1)
  %tmp148 = load i32* %c, align 4
  %tobool149 = icmp ne i32 %tmp148, 0
  br i1 %tobool149, label %lor.end153, label %lor.rhs150

lor.rhs150:                                       ; preds = %lor.end144
  %tmp151 = load i32* %e, align 4
  %tobool152 = icmp ne i32 %tmp151, 0
  br label %lor.end153

lor.end153:                                       ; preds = %lor.rhs150, %lor.end144
  %15 = phi i1 [ true, %lor.end144 ], [ %tobool152, %lor.rhs150 ]
  %lor.ext154 = zext i1 %15 to i32
  %tmp155 = load i32* %d, align 4
  %sub156 = sub nsw i32 %tmp155, %lor.ext154
  store i32 %sub156, i32* %d, align 4
  call void @f(i32 %sub156, i32 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %16 = load i32* %retval
  ret i32 %16
}

declare void @exit(i32) noreturn nounwind
