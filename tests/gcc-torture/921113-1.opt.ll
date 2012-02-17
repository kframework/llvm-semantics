; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921113-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.struct_list = type { float }
%struct.vector_t = type { float, float }

@pos = global [1 x %struct.vector_t] zeroinitializer, align 4
@limit = global [2 x %struct.vector_t] [%struct.vector_t zeroinitializer, %struct.vector_t { float 1.000000e+00, float 1.000000e+00 }], align 16

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

define void @w(float %x, float %y) nounwind uwtable readnone {
entry:
  ret void
}

define void @f1(float %x, float %y) nounwind uwtable {
entry:
  %cmp = fcmp une float %x, 0.000000e+00
  %cmp2 = fcmp une float %y, 0.000000e+00
  %or.cond = or i1 %cmp, %cmp2
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f2(float %x, float %y) nounwind uwtable {
entry:
  %cmp = fcmp une float %x, 1.000000e+00
  %cmp2 = fcmp une float %y, 1.000000e+00
  %or.cond = or i1 %cmp, %cmp2
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @gitter(i32 %count, %struct.vector_t* %pos, %struct.struct_list* %list, i32* %nww, %struct.vector_t* %limit, float %r) nounwind uwtable {
entry:
  %x = getelementptr inbounds %struct.vector_t* %limit, i64 0, i32 0
  %tmp1 = load float* %x, align 4
  %y = getelementptr inbounds %struct.vector_t* %limit, i64 0, i32 1
  %tmp4 = load float* %y, align 4
  %cmp.i = fcmp une float %tmp1, 0.000000e+00
  %cmp2.i = fcmp une float %tmp4, 0.000000e+00
  %or.cond.i = or i1 %cmp.i, %cmp2.i
  br i1 %or.cond.i, label %if.then.i, label %f1.exit

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f1.exit:                                          ; preds = %entry
  %x7 = getelementptr inbounds %struct.vector_t* %limit, i64 1, i32 0
  %tmp8 = load float* %x7, align 4
  %y11 = getelementptr inbounds %struct.vector_t* %limit, i64 1, i32 1
  %tmp12 = load float* %y11, align 4
  %cmp.i1 = fcmp une float %tmp8, 1.000000e+00
  %cmp2.i2 = fcmp une float %tmp12, 1.000000e+00
  %or.cond.i3 = or i1 %cmp.i1, %cmp2.i2
  br i1 %or.cond.i3, label %if.then.i4, label %f2.exit

if.then.i4:                                       ; preds = %f1.exit
  tail call void @abort() noreturn nounwind
  unreachable

f2.exit:                                          ; preds = %f1.exit
  store i32 0, i32* %nww, align 4
  %x16 = getelementptr inbounds %struct.vector_t* %pos, i64 0, i32 0
  %tmp17 = load float* %x16, align 4
  %conv = fpext float %tmp17 to double
  %cmp = fcmp ugt double %conv, 0.000000e+00
  br i1 %cmp, label %if.end33, label %if.then

if.then:                                          ; preds = %f2.exit
  %conv25 = fpext float %r to double
  %mul = fmul double %conv25, 5.000000e-01
  %cmp26 = fcmp ugt double %conv, %mul
  br i1 %cmp26, label %if.end33, label %if.then28

if.then28:                                        ; preds = %if.then
  %wsx = getelementptr inbounds %struct.struct_list* %list, i64 0, i32 0
  store float 1.000000e+00, float* %wsx, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then28, %if.then, %f2.exit
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp1.i = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 0, i32 0), align 16
  %tmp4.i = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 0, i32 1), align 4
  %cmp.i.i = fcmp une float %tmp1.i, 0.000000e+00
  %cmp2.i.i = fcmp une float %tmp4.i, 0.000000e+00
  %or.cond.i.i = or i1 %cmp.i.i, %cmp2.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %f1.exit.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f1.exit.i:                                        ; preds = %entry
  %tmp8.i = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 1, i32 0), align 8
  %tmp12.i = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 1, i32 1), align 4
  %cmp.i1.i = fcmp une float %tmp8.i, 1.000000e+00
  %cmp2.i2.i = fcmp une float %tmp12.i, 1.000000e+00
  %or.cond.i3.i = or i1 %cmp.i1.i, %cmp2.i2.i
  br i1 %or.cond.i3.i, label %if.then.i4.i, label %f2.exit.i

if.then.i4.i:                                     ; preds = %f1.exit.i
  tail call void @abort() noreturn nounwind
  unreachable

f2.exit.i:                                        ; preds = %f1.exit.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
