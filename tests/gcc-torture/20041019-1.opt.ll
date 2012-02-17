; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041019-1.ll'
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

define i32 @test_store_ccp(i32 %i) nounwind uwtable readonly {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %cmp = icmp slt i32 %i, 5
  br i1 %cmp, label %if.end5, label %if.else

if.else:                                          ; preds = %entry
  %cmp2 = icmp sgt i32 %i, 8
  %b.c = select i1 %cmp2, i32* %b, i32* %c
  br label %if.end5

if.end5:                                          ; preds = %entry, %if.else
  %storemerge1 = phi i32* [ %b.c, %if.else ], [ %a, %entry ]
  store i32 10, i32* %storemerge1, align 4
  store i32 3, i32* %b, align 4
  %tmp8 = load i32* %storemerge1, align 4
  %add = add nsw i32 %tmp8, 2
  ret i32 %add
}

define i32 @test_store_copy_prop(i32 %i) nounwind uwtable readonly {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %cmp = icmp slt i32 %i, 5
  br i1 %cmp, label %if.end5, label %if.else

if.else:                                          ; preds = %entry
  %cmp2 = icmp sgt i32 %i, 8
  %b.c = select i1 %cmp2, i32* %b, i32* %c
  br label %if.end5

if.end5:                                          ; preds = %entry, %if.else
  %storemerge1 = phi i32* [ %b.c, %if.else ], [ %a, %entry ]
  store i32 %i, i32* %storemerge1, align 4
  %add = add nsw i32 %i, 1
  store i32 %add, i32* %b, align 4
  %tmp10 = load i32* %storemerge1, align 4
  ret i32 %tmp10
}

define i32 @main() nounwind uwtable {
test_store_ccp.exit:
  %b.i1 = alloca i32, align 4
  %c.i2 = alloca i32, align 4
  %b.i = alloca i32, align 4
  %c.i = alloca i32, align 4
  %0 = bitcast i32* %b.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast i32* %c.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1)
  store i32 3, i32* %b.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %1)
  %2 = bitcast i32* %b.i1 to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2)
  %3 = bitcast i32* %c.i2 to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %3)
  store i32 10, i32* %b.i1, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %2)
  call void @llvm.lifetime.end(i64 -1, i8* %3)
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
