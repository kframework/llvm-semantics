; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921117-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.s = type { [11 x i8], i32 }

@.str = private unnamed_addr constant [11 x i8] c"0123456789\00", align 1
@cell = common global %struct.s zeroinitializer, align 8

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

define i32 @check(i64 %p.coerce0, i64 %p.coerce1) nounwind uwtable readonly {
entry:
  %p = alloca %0, align 8
  %0 = getelementptr %0* %p, i64 0, i32 0
  store i64 %p.coerce0, i64* %0, align 8
  %1 = getelementptr %0* %p, i64 0, i32 1
  store i64 %p.coerce1, i64* %1, align 8
  %tmp1.mask = and i64 %p.coerce1, -4294967296
  %cmp = icmp eq i64 %tmp1.mask, 425201762304
  br i1 %cmp, label %if.end, label %return

if.end:                                           ; preds = %entry
  %arraydecay = bitcast %0* %p to i8*
  %call = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  br label %return

return:                                           ; preds = %entry, %if.end
  %storemerge = phi i32 [ %call, %if.end ], [ 1, %entry ]
  ret i32 %storemerge
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define i32 @main() noreturn nounwind uwtable {
entry:
  %p.i = alloca %0, align 8
  store i32 99, i32* getelementptr inbounds (%struct.s* @cell, i64 0, i32 1), align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds (%struct.s* @cell, i64 0, i32 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i64 11, i32 1, i1 false)
  %0 = load i64* bitcast (i8* getelementptr inbounds (%struct.s* @cell, i64 0, i32 0, i64 8) to i64*), align 8
  %1 = bitcast %0* %p.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %2 = getelementptr %0* %p.i, i64 0, i32 0
  store i64 3978425819141910832, i64* %2, align 8
  %3 = getelementptr %0* %p.i, i64 0, i32 1
  store i64 %0, i64* %3, align 8
  %tmp1.mask.i = and i64 %0, -4294967296
  %cmp.i = icmp eq i64 %tmp1.mask.i, 425201762304
  br i1 %cmp.i, label %check.exit, label %check.exit.thread

check.exit.thread:                                ; preds = %entry
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  br label %if.then

check.exit:                                       ; preds = %entry
  %call.i = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %tobool = icmp eq i32 %call.i, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %check.exit.thread, %check.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %check.exit
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
