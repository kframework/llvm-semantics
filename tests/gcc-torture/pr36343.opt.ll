; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr36343.ll'
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

define void @bar(i32** nocapture %p) nounwind uwtable noinline {
entry:
  %0 = bitcast i32** %p to float*
  store float 0.000000e+00, float* %0, align 4
  ret void
}

define float @foo(i32 %b) nounwind uwtable noinline {
entry:
  %i = alloca i32*, align 8
  %f = alloca float, align 4
  store i32* null, i32** %i, align 8
  store float 1.000000e+00, float* %f, align 4
  %tobool = icmp eq i32 %b, 0
  br i1 %tobool, label %if.end8, label %if.then4

if.then4:                                         ; preds = %entry
  call void @bar(i32** %i)
  %tmp6 = load i32** %i, align 8
  %tmp7 = load i32* %tmp6, align 4
  %conv = sitofp i32 %tmp7 to float
  br label %return

if.end8:                                          ; preds = %entry
  %0 = bitcast float* %f to i32**
  call void @bar(i32** %0)
  %tmp9 = load float* %f, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then4
  %storemerge1 = phi float [ %conv, %if.then4 ], [ %tmp9, %if.end8 ]
  ret float %storemerge1
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call float @foo(i32 0)
  %conv = fpext float %call to double
  %cmp = fcmp une double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
