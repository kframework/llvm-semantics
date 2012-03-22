; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080604-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.barstruct = type { i8* }

@x = common global %struct.barstruct zeroinitializer, align 8
@.str = private unnamed_addr constant [14 x i8] c"Everything OK\00", align 1

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

define void @foo() nounwind uwtable noinline {
entry:
  %tmp = load i8** getelementptr inbounds (%struct.barstruct* @x, i64 0, i32 0), align 8
  %tobool = icmp eq i8* %tmp, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @baz(i32 %b) nounwind uwtable {
entry:
  %bar.0 = alloca %struct.barstruct, align 8
  %tobool = icmp eq i32 %b, 0
  %x.bar = select i1 %tobool, %struct.barstruct* @x, %struct.barstruct* %bar.0
  %some_string = getelementptr inbounds %struct.barstruct* %x.bar, i64 0, i32 0
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** %some_string, align 8
  call void @foo()
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** %some_string, align 8
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  %bar.0.i = alloca %struct.barstruct, align 8
  %0 = bitcast %struct.barstruct* %bar.0.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.barstruct* @x, i64 0, i32 0), align 8
  call void @foo() nounwind
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.barstruct* @x, i64 0, i32 0), align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
