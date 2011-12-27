; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr42231.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@max = internal unnamed_addr global i32 0, align 4

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
  %depth.addr.i.i = alloca i32, align 4
  %call.i = call fastcc i32 @CallFunctionRec(i32 (i32)* @callback, i32 1) nounwind
  %tobool.i = icmp eq i32 %call.i, 0
  br i1 %tobool.i, label %CallFunction.exit, label %land.rhs.i

land.rhs.i:                                       ; preds = %entry
  %0 = bitcast i32* %depth.addr.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store i32 0, i32* %depth.addr.i.i, align 4
  call fastcc void @storemax(i32 0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  br label %CallFunction.exit

CallFunction.exit:                                ; preds = %entry, %land.rhs.i
  %tmp = load i32* @max, align 4
  %cmp = icmp eq i32 %tmp, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %CallFunction.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %CallFunction.exit
  ret i32 0
}

define internal i32 @callback(i32 %depth) nounwind uwtable {
entry:
  tail call fastcc void @storemax(i32 %depth)
  %cmp = icmp ne i32 %depth, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @abort() noreturn nounwind

define internal fastcc void @storemax(i32 %i) nounwind uwtable noinline {
entry:
  %tmp1 = load i32* @max, align 4
  %cmp = icmp slt i32 %tmp1, %i
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 %i, i32* @max, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define internal fastcc i32 @CallFunctionRec(i32 (i32)* %fun, i32 %depth) nounwind uwtable {
entry:
  %call = tail call i32 %fun(i32 %depth) nounwind
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp = icmp slt i32 %depth, 10
  br i1 %cmp, label %if.then3, label %return

if.then3:                                         ; preds = %if.end
  %add = add nsw i32 %depth, 1
  %call6 = tail call fastcc i32 @CallFunctionRec(i32 (i32)* %fun, i32 %add)
  ret i32 1

return:                                           ; preds = %if.end, %entry
  %storemerge = phi i32 [ 0, %entry ], [ 1, %if.end ]
  ret i32 %storemerge
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
